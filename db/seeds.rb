# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', first_name: 'Admin', last_name: 'User')

# Inquiry.create!(email: 'admin@example.com', phone_number: '08108444978', message: 'This is a test message',  name: 'Tester James')
# Applicant.create!(email: 'admin@example.com', phone_number: '08108444978', profession: 'Teacher', reason_for_applying: 'This is a test message',  name: 'Tester James')