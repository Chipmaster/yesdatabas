class FieldType < ActiveRecord::Base
  has_many :data_fields
  validates_presence_of :name
  validates_uniqueness_of :name

  def all_fields
    FieldType.find(:all)
  end
end
