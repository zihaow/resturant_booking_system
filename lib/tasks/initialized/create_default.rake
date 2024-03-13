namespace :initialized do
  desc 'Create default developers'
  task create_default: :environment do
    wendys = Resturant.find_or_create_by(
      name: 'Wendys',
      from: 8,
      to: 22,
      max_allow_duration: 1
    )
    thai = Resturant.find_or_create_by(
      name: 'May Garden',
      from: 12,
      to: 23,
      max_allow_duration: 2
    )
    keg = Resturant.find_or_create_by(
      name: 'The Keg Steakhouse',
      from: 14,
      to: 22,
      max_allow_duration: 3
    )

    Table.create!(size: 6, resturant: wendys)
    Table.create!(size: 6, resturant: thai)
    Table.create!(size: 6, resturant: thai)
    Table.create!(size: 6, resturant: keg)
    Table.create!(size: 6, resturant: keg)
    Table.create!(size: 6, resturant: keg)
  end
end
