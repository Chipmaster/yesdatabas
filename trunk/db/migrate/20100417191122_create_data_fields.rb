class CreateDataFields < ActiveRecord::Migration
  def self.up
    create_table :data_fields do |t|
      t.string :value
      t.references :user
      t.references :field_type
      
    end
  end

  def self.down
    drop_table :data_fields
  end
end
