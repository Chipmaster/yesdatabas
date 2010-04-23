class RedoUsers < ActiveRecord::Migration
  def self.up
    User.delete_all
  end

  def self.down
    User.delete_all
  end

end
