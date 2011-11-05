Factory.define :season do |s|
  s.start_date Time.now
  s.end_date Time.now + 1.year
  s.starting_kudos 2
  s.max_kudos_per_user 10

  s.association :group, :factory => :group
end

Factory.define :group do |g|
  g.name 'Test group'
  g.description 'Just a factoried test group'
end

Factory.define :user do |u|
  u.name 'Chuck Norris'
  u.email 'chuck@example.net'
  u.password 'pass'
  u.password_confirmation 'pass'
  u.role 'user'

  u.association :group, :factory => :group
end


Factory.define :kudo do |k|
  k.message 'Oooouuhhh yyyyyeah'

  k.association :from, :factory => :from
  k.association :to, :factory => :to
  k.association :season, :factory => :season
end

Factory.define :comment do |c|
  c.text 'Oooouuhhh yyyyyeah'
  c.value 0

  c.association :user, :factory => :user
  c.association :kudo, :factory => :kudo
end

Factory.define :prize do |p|
  p.name 'A great present'
  p.description 'A great description for a great present'
end
