class CssController < ApplicationController
  #Display the css upload view
  def index
     render :file => 'css/uploadfile.rhtml'
  end
  #On upload call our model to save the file
  def uploadFile
    post = DataFile.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end
end
