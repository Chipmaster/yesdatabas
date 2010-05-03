class DataField < ActiveRecord::Base
  # Create fields for user and fieldtype foreign keys
  belongs_to :user
  belongs_to :field_type

  # Creates a field with a link to a specific fieldtype and user
  def self.create(value, user, fieldtype)
    @field = DataField.new
    @field.value = value
    user << @field
    fieldtype << @field
  end
end
