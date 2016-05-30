# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cash.destroy_all

primary = Cash.create name: 'Primary'
secondary = Cash.create name: 'Secondary'

primary.moves.create ammount: 100.50, kind: Move::IN
primary.moves.create ammount: 50.50, kind: Move::OUT
primary.moves.create ammount: 25, kind: Move::IN
primary.moves.create ammount: 25.75, kind: Move::IN
primary.moves.create ammount: 50.75, kind: Move::OUT

secondary.moves.create ammount: 30, kind: Move::IN
secondary.moves.create ammount: 120, kind: Move::IN
secondary.moves.create ammount: 800, kind: Move::IN
secondary.moves.create ammount: 90, kind: Move::IN
secondary.moves.create ammount: 100, kind: Move::IN
secondary.moves.create ammount: 300, kind: Move::OUT
