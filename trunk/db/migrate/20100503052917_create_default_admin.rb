class CreateDefaultAdmin < ActiveRecord::Migration
  def self.up
    User.create(:email => 'admin@admin.com', :password => 'admin', :usertype => 'admin')
  end

  def self.down
    User.delete_all
  end
end
