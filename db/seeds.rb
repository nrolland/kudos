# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



(1..2).each do |i|
  group= Group.create( :name => "Group #{i}", :description => "Example group #{i}");

  (1..2).each do |x|
    user=User.create(   :name => "User #{x} of group #{i}",
                        :email => "user#{x}@group#{i}.com",
                        :password => "1234",
                        :password_confirmation => "1234",
                        :role => :admin )
    group.users << user
  end
end

