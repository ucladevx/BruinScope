# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

company_list = [
	[ "Facebook", "Menlo Park, CA" ],
	[ "Google", "Mountain View, CA" ],
	[ "Uber", "San Francisco, CA" ],
	[ "Microsoft", "Redmond, WA" ],
	[ "Apple", "Cupertino, CA" ],
	[ "Airbnb", "San Francisco, CA" ]
]

company_list.each do |name, location|
	Company.create(name: name, location: location)
end
