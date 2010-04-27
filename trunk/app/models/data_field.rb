class DataField < ActiveRecord::Base
  belongs_to :user
  belongs_to :field_type

  def self.create(value, user, fieldtype)
    @field = DataField.new
    @field.value = value
    user << @field
    fieldtype << @field
  end
end
