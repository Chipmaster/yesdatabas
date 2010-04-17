class FieldType < ActiveRecord::Base
  has_many :data_fields, :dependent => :delete_all
end
