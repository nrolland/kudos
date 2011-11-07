# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



(1..2).each do |i|
  group = Group.create( :name => "Group #{i}", :description => "Example group #{i}");

  season = group.seasons.create( :start_date => Time.now, :end_date => Time.now + i.year, :starting_kudos => 2, :max_kudos_per_user => 2)

  (1..2).each do |x|
    group.users.create( :name => "User #{x} of group #{i}",
                        :email => "user#{x}@group#{i}.com",
                        :password => "1234",
                        :password_confirmation => "1234",
                        :role => "admin" )
  end
end

group = Group.first
first_user = group.users.first
second_user = group.users.second
sample_season = group.seasons.first

Kudo.create(:season => sample_season, :from => first_user, :to => second_user, :message => 'Seeded kudo')