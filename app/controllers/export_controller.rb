class ExportController < ApplicationController
	# require 'rubygems' if using this outside of Rails
require 'fastercsv'

	def dump_csv
	  @users = User.find(:all, :order => "Email")
	  @user = User.find(:first);
	  @outfile = "members_" + Time.now.strftime("%m-%d-%Y") + ".csv"
	  @fieldtypes = FieldType.find(:all)
	  fieldnames = []
	  fieldnames.push("Last Name" + "\t")
	  fieldnames.push("First Name"+ "\t")
	  fieldnames.push("Email"+ "\t")
	  fieldnames.push("Usertype"+ "\t")
	  @fieldtypes.each do |field| 
		fieldnames.push(field.name + "\t")
	  end
		
	 
	  csv_data = FasterCSV.generate do |csv|
		csv << [
			fieldnames.each do |field|
				field
			end
		]
		
		@users.each do |user|
			data = []
			data.push(user.lastname + "\t")
			data.push(user.firstname + "\t")
			data.push(user.email + "\t")
			data.push(user.usertype + "\t")
			@fieldtypes.each do |field|
				temp = field.data_fields.find(:first, :conditions => {:user_id => user.id})
				if temp != nil
					data.push(temp.value + "\t")
				else
					data.push("Empty" + "\t")
				end
			end
			csv << [
				data
			]
			#@fieldtypes.each do |field| 
			#	csv << [ 
			#		user.field.name
			#	]
			#end	
	
		end
	  end

	  send_data csv_data,
		:type => 'text/csv; charset=iso-8859-1; header=present',
		:disposition => "attachment; filename=#{@outfile}"

	  flash[:notice] = "Export complete!"
	end
	
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
