class ExportController < ApplicationController
	# require 'rubygems' if using this outside of Rails
require 'fastercsv'
	
	#  This is the routine called when the "export to csv" button is pressed
	#  Depending on the values passed in by the checkbox, appropriate information will
	#  be output.  
	def dump_csv
	
		#  The 'master' list of fields is retrived from the first user, ordered by usertype.  This can be done
		#  because all users will have every field, so the field information will be the same.
		#  A string with filename information is also declared.
	  @users = User.find(:all, :order => "Usertype")
	  @user = User.find(:first);
	  @outfile = "members_" + Time.now.strftime("%m-%d-%Y") + ".tsv"
	  @fieldtypes = FieldType.find(:all)
	  fieldnames = []
	 
		#  params[:field_id] contains information retreived from the checkboxes.  If the 
		#  value is 1, then the box is checked and the field will be added to fieldnames.
		#  fieldnames is a list that will be output to the csv file via the csv << [] command.
	  if(params[:lastname].to_i == 1)
		fieldnames.push("Last Name" + "\t")
	  end
	  if(params[:firstname].to_i == 1)
		fieldnames.push("First Name"+ "\t")
	  end
	  if(params[:email].to_i == 1)
		fieldnames.push("Email"+ "\t")
	  end
	  if(params[:usertype].to_i == 1)
		fieldnames.push("Usertype"+ "\t")
	  end
	  
	  #  All the custom fields need to be checked a little differently.
	  #  Because any duplicate field ID is ignored, I was forced to use a hash.
	  #  Syntactically, this means a slight difference in where the values are.
	  #  Values are stored in params[:custom][:field_id]
	  #  This same logic is applied when drawing on the actual data from a user.
	  
	  @fieldtypes.each do |field| 
		a = []
		a = params[:custom]
		if(a != nil)
			if(params[:custom]["#{field.name}"].to_i == 1)
				fieldnames.push(field.name + "\t")
			end
		end
	  end
	  
	  csv_data = FasterCSV.generate do |csv|
		csv << [
			fieldnames.each do |field|
				field
			end
		]
		
		#  For each user, each param is checked to see if it's associated data needs to be output.
		#  If it needs to be output, it is added to data[] and then data[] is output to a csv.
		@users.each do |user|
			data = []
			if(params[:lastname].to_i == 1)
			  data.push(user.lastname + "\t")
			end
			if(params[:firstname].to_i == 1)
			  data.push(user.firstname + "\t")
			end
			if(params[:email].to_i == 1)
			  data.push(user.email + "\t")
			end
			if(params[:usertype].to_i == 1)
			  data.push(user.usertype + "\t")
			end
			@fieldtypes.each do |field|
				a = []
				a = params[:custom]
				if(a != nil)
					if(params[:custom]["#{field.name}"].to_i == 1)
						temp = field.data_fields.find(:first, :conditions => {:user_id => user.id})
						if temp != nil
							data.push(temp.value + "\t")
						else
							data.push("Empty" + "\t")
						end
					end
				end
			end
			csv << [
				data
			]
	
		end
	  end

	  send_data csv_data,
		:type => 'text/csv; charset=iso-8859-1; header=present',
		:disposition => "attachment; filename=#{@outfile}"

	  flash[:notice] = "Export complete!"
	end
	
	#  The Index method displays the index.html page, which has a list of field names and checkboxes.
	def index
    @user = User.find(:first);
    if (session[:id].to_s == params[:id].to_s) || session[:adminuser]
      
      @fieldtypes = FieldType.find(:all)
      @fields = @user.data_fields

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @users }
      end
    else
      redirect_to :action => "dump_csv", :id => session[:id].to_s
    end
  end

end
