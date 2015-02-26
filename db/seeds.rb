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
a = p.activities.create(name:"Earthwork", amount: 100, rate: 10, crew_size: 5)
b = p.activities.create(name:"Excavation", amount: 100, rate: 10, crew_size: 5)
c = p.activities.create(name:"Formwork", amount: 100, rate: 10, crew_size: 5)
d = p.activities.create(name:"Foundations", amount: 100, rate: 10, crew_size: 5)
e = p.activities.create(name:"Electric", amount: 100, rate: 10, crew_size: 5)
f = p.activities.create(name:"Piping", amount: 100, rate: 10, crew_size: 5)
g = p.activities.create(name:"Mechanical", amount: 100, rate: 10, crew_size: 5)
h = p.activities.create(name:"HVAC", amount: 100, rate: 10, crew_size: 5)
i = p.activities.create(name:"Utilities", amount: 100, rate: 10, crew_size: 5)
Dependency.create([{ activity_id: b.id, predecessor_id: a.id}, 
                  { activity_id: c.id, predecessor_id: a.id }, 
                  { activity_id: c.id, predecessor_id: b.id },
                  { activity_id: f.id, predecessor_id: c.id },
                  { activity_id: d.id, predecessor_id: a.id },
                  { activity_id: e.id, predecessor_id: d.id },
                  { activity_id: g.id, predecessor_id: e.id },
                  { activity_id: h.id, predecessor_id: f.id },
                  { activity_id: h.id, predecessor_id: g.id },
                  { activity_id: i.id, predecessor_id: h.id },
                  ])

