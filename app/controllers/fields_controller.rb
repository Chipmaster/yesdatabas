class FieldsController < ApplicationController
  def index
    @fields = FieldType.find(:all)
  end

  def new
    @field = FieldType.new
    @field.name = params[:name]
    @field.save!
    redirect_to :action => "index"
  end

  def edit
    @field = FieldType.find(params[:previous])
    @field.name = params[:name]
    @field.save!
    redirect_to :action => "index"
  end

  def destroy
    FieldType.delete(params[:destroy])
    redirect_to :action => "index"
  end

end
