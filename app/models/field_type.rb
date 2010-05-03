class FieldType < ActiveRecord::Base
  has_many :data_fields
  validates_presence_of :name
  validates_uniqueness_of :name

  def all_fields
    FieldType.find(:all)
  end

  def self.update_custom(user, params)
    #This updates or creates the custom field for a user and a fieldtype.
    @fields = user.data_fields
    @fieldtypes = FieldType.all
    @fieldtypes.each do |field|
      temp = field.data_fields.find(:first, :conditions => {:user_id => user.id})
      if temp
        temp.value = params[field.name]
        temp.save
      else
        @field = DataField.new
        @field.value = params[field.name]
        user.data_fields << @field
        field.data_fields << @field
        @field.save
      end
    end
  end
end
