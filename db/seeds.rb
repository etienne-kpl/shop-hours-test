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

p 'Done!'
