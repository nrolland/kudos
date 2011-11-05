Factory.define :season do |season|
  season.start_date Time.now
  season.end_date Time.now + 1.year
  season.starting_kudos 2
  season.max_kudos_per_user 10
end
