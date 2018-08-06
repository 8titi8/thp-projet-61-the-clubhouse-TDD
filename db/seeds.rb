# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

titi = User.create(first_name: 'Mathilde', last_name: 'Ray',
                  email: 'math@mail.com', password: '123456',
                  password_confirmation: '123456')

gaga = User.create(first_name: 'Gaelle', last_name: 'Gorgori',
                  email: 'gaga@mail.com', password: '123456',
                  password_confirmation: '123456')

toto = User.create(first_name: 'Thomas', last_name: 'Fernandez',
                  email: 'toto@mail.com', password: '123456',
                  password_confirmation: '123456')
