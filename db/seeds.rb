# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.destroy_all
Activity.destroy_all
Dependency.destroy_all
p = Project.create(name: "Pilot")
a = p.activities.create(name:"Excavation", amount: 100, rate: 10, crew_size: 5)
b = p.activities.create(name:"Earthwork", amount: 100, rate: 10, crew_size: 5)
c = p.activities.create(name:"Foundations", amount: 100, rate: 10, crew_size: 5)
Dependency.create([{ activity_id: b.id, predecessor_id: a.id}, { activity_id: c.id, predecessor_id: a.id }, { activity_id: c.id, predecessor_id: b.id }])

