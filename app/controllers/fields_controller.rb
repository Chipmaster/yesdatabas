class FieldsController < ApplicationController
  def index
    # Displays fieldtypes
    @fields = FieldType.find(:all)
  end

  def new
    # Creates a new fieldtype
    @field = FieldType.new
    @field.name = params[:name]
    @field.save!
    redirect_to :action => "index"
  end

  def edit
    # Edits the name of the fieldtype
    @field = FieldType.find(params[:previous])
    @field.name = params[:name]
    @field.save!
    redirect_to :action => "index"
  end

  def destroy
    # Deletes the fieldtype and all associated datafields
    FieldType.delete(params[:destroy])
    redirect_to :action => "index"
  end

end
