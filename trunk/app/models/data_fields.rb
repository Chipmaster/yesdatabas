class DataField < ActiveRecord::Base
  belongs_to :user
  belongs_to :field_type
end
