class CssController < ApplicationController
   def index
     render :file => 'css/uploadfile.rhtml'
  end
  def uploadFile
    post = DataFile.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end
end
