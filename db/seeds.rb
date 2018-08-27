# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create([
              { body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ornare dapibus urna. Etiam pellentesque velit a lacus ultrices finibus. Nunc. ' },
              { body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a nulla iaculis, condimentum nunc ut, consequat libero. Sed laoreet est. ' }
            ])
