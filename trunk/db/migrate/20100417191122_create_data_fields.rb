class CreateDataField < ActiveRecord::Migration
  def self.up
    create_table :data_field do |t|
      t.string :value
      t.references :user
      t.references :field_type
      
    end
  end

  def self.down
    drop_table :data_field
  end
end