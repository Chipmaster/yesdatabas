class AddUsers < ActiveRecord::Migration
  def self.up
    User.delete_all
    User.create(:email => 'stettp@rpi.edu', :firstname => 'patrick', :lastname => 'stetter',
                :password => '12345', :usertype => 'admin')
	User.create(:email => 'mcclyc@rpi.edu', :firstname => 'corey', :lastname => 'mcclymonds',
                :password => '12345', :usertype => 'admin')
	User.create(:email => 'meteyd@rpi.edu', :firstname => 'dan', :lastname => 'meteyer',
                :password => '12345', :usertype => 'admin')
	User.create(:email => 'martim6@rpi.edu', :firstname => 'mike', :lastname => 'martin',
                :password => '12345', :usertype => 'admin')
  end

  def self.down
    User.delete_all
  end
end
