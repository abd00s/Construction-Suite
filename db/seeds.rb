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
a = p.activities.create(name:"Earthwork", amount: 100, rate: 10, crew_size: 5, duration: 5)
b = p.activities.create(name:"Excavation", amount: 100, rate: 10, crew_size: 5, duration: 4)
c = p.activities.create(name:"Formwork", amount: 100, rate: 10, crew_size: 5, duration: 6)
d = p.activities.create(name:"Foundations", amount: 100, rate: 10, crew_size: 5, duration: 4)
e = p.activities.create(name:"Electric", amount: 100, rate: 10, crew_size: 5, duration: 7)
f = p.activities.create(name:"Piping", amount: 100, rate: 10, crew_size: 5, duration: 9)
g = p.activities.create(name:"Mechanical", amount: 100, rate: 10, crew_size: 5, duration: 4)
h = p.activities.create(name:"HVAC", amount: 100, rate: 10, crew_size: 6, duration: 5)
i = p.activities.create(name:"Utilities", amount: 100, rate: 10, crew_size: 5, duration: 8)
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

x = Project.create(name: "Syque")
l = x.activities.create(name:"VCO", amount: 100, rate: 10, crew_size: 5, duration: 1)
m = x.activities.create(name:"AS", amount: 100, rate: 10, crew_size: 5, duration: 2)
n = x.activities.create(name:"EC", amount: 100, rate: 10, crew_size: 5, duration: 3)
o = x.activities.create(name:"RS", amount: 100, rate: 10, crew_size: 5, duration: 5)
p = x.activities.create(name:"VS", amount: 100, rate: 10, crew_size: 5, duration: 1)
Dependency.create([{ activity_id: n.id, predecessor_id: l.id},
                  { activity_id: n.id, predecessor_id: m.id },
                  { activity_id: o.id, predecessor_id: m.id },
                  { activity_id: p.id, predecessor_id: n.id }
                  ])