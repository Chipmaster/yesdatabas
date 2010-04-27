class CreateFieldTypes < ActiveRecord::Migration
  def self.up
    create_table "field_types", :force => true do |t|
      t.string   "name"
      t.string   "description"
      t.references
    end
  end

  def self.down
    drop_table "field_types"
  end
end
