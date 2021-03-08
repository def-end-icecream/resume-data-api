# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

educations = Education.create!([
  {
    start_date: "2021-01-01",
    end_date: "2021-01-02",
    degree: "Bachelor's",
    university_name: "Somewhere USA",
    details: "Whooo, i'm a college graduate!"
  },
  {
    start_date: "2021-01-03",
    end_date: "2021-01-04",
    degree: "Bachelor's",
    university_name: "Somewhere USA",
    details: "This was so hard..."
  },
  {
    start_date: "2021-01-05",
    end_date: "2021-01-06",
    degree: "Bachelor's",
    university_name: "Somewhere USA",
    details: "Hot damn, would ya look at this paper?"
  },
])