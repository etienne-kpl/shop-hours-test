p 'Destroying shops...'
Shop.destroy_all

p 'Creating shops...'
Shop.create(name: 'Le Collectionist - Paris')
Shop.create(name: 'Le Collectionist - Bordeaux')
Shop.create(name: 'Le Collectionist - Marseille')
Shop.create(name: 'Le Collectionist - Annecy')
Shop.create(name: 'Le Collectionist - Verbier')
Shop.create(name: 'Le Collectionist - Ibiza')
Shop.create(name: 'Le Collectionist - Barcelone')

p 'Adding slots to each shop...'
Shop.all.each do |shop|
  5.times do |x|
    shop.slots.create(start_time: '10:30', end_time: '15:00', weekday: x + 1)
    shop.slots.create(start_time: '17:00', end_time: '20:00', weekday: x + 1)
  end
  shop.slots.create(start_time: '10:30', end_time: '20:00', weekday: 6)
end

p 'Adding holiday to each shop...'
Shop.all.each do |shop|
  shop.holidays.create(date: '2023-02-06')
end

p 'Done!'
