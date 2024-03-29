class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :password
      t.string :usertype

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
