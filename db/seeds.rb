# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(email: "admin@admin.com", password: "password", password_confirmation: "password")

admin.add_role :admin

non_profit = User.create(name: "christian", email: "admin@admin.com", password: "password", password_confirmation: "password", organization: "south florida drone user group")

non_profit.add_role :non_profit

wizards = [
		User.create(name: , email: , password: , password_confirmation: linkedin: , github: )
	]

wizards.each do |wizard|
	wizard.add_role :wizard
end

acolytes = [
		User.create(name: , email: , password: , password_confirmation: linkedin: , github: )
	]

acolytes.each do |acolyte|
	acolyte.add_role :acolyte
end