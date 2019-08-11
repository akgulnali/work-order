# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Running seeds.rb..."

begin
	Order.create({title: "First Order", description: "1st Order", deadline: "2019-07-04"})
	Order.create({title: "Second Order", description: "2nd Order", deadline: "2019-07-05"})
	Order.create({title: "Third Order", description: "3rd Order", deadline: "2019-07-06"})
	Order.create({title: "Fourth Order", description: "4th Order", deadline: "2019-07-07"})
	Order.create({title: "Fifth Order", description: "5th Order", deadline: "2019-06-01"})
	Order.create({title: "Sixth Order", description: "6th Order", deadline: "2019-06-02"})

	puts "Orders are created successfully."
rescue Exception => e
	puts "Something went wrong. Orders couldn't created successfully."
	puts "Errors: #{e}"
end

begin
	Worker.create({name: "First Worker", company_name: "Company A", email: "first@mail.com"})
	Worker.create({name: "Second Worker", company_name: "Company A", email: "second@mail.com"})
	Worker.create({name: "Third Worker", company_name: "Company A", email: "third@mail.com"})
	Worker.create({name: "Fourth Worker", company_name: "Company B", email: "fourth@mail.com"})
	Worker.create({name: "Fifth Worker", company_name: "Company C", email: "fifth@mail.com"})
	Worker.create({name: "Sixth Worker", company_name: "Company C", email: "sixth@mail.com"})

	puts "Workers are created successfully."
rescue Exception => e
	puts "Something went wrong. Workers couldn't created successfully."
	puts "Errors: #{e}"
end

puts "Running seeds.rb is completed."

