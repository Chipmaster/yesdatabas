class DataFile < ActiveRecord::Base
   def self.save(upload)
     path = "public/stylesheets/main.css"
    # write the file
     File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
end
