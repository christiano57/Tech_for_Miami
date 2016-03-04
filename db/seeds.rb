# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(email: "admin@admin.com", password: "password", password_confirmation: "password")

admin.add_role :admin

non_profit = User.create(name: "christian", email: "nonprofit@nonprofit.com", password: "password", password_confirmation: "password", organization: "south florida drone user group")

non_profit.add_role :non_profit

wizards = [
		User.create(name: "Nizar" , email: "Nizar@ironhack.com" , password: "password" , password_confirmation: "password", linkedin: "https://www.linkedin.com/in/khalifenizar" , github: "https://github.com/khalifenizar")
	]

wizards.each do |wizard|
	wizard.add_role :wizard
end

acolytes = [
		User.create(name: "karin" , email: "karin@ironhack.com" , password: "password" , password_confirmation: "password", linkedin: "https://www.linkedin.com/in/karin-fernandez-a4659910a?trk=hp-identity-name" , github: "https://github.com/karinfdez"),
		User.create(name: "jannelle" , email: "jannelle@ironhack.com", password: "password", password_confirmation: "password", linkedin: "https://www.linkedin.com/in/jeanellafanzago", github: "https://github.com/Jfanzago" ),
		User.create(name: "nick" , email: "nick@ironhack.com", password: "password", password_confirmation: "password", linkedin: "https://www.linkedin.com/in/nicholas-borbe-2558a9a1", github: "https://github.com/nickborbe" ),
		User.create(name: "anais" , email: "anais@ironhack.com", password: "password", password_confirmation: "password", linkedin: "http://www.linkedin.com/in/anaiscorinne", github: "https://github.com/anaiscorinne" ),
		User.create(name: "bianca" , email: "bianca@ironhack.com", password: "password", password_confirmation: "password", linkedin: "http://www.linkedin.com/in/bsemprit", github: "https://github.com/bsemprit" ),
		User.create(name: "javier" , email: "javier@ironhack.com", password: "password", password_confirmation: "password", linkedin: "https://www.linkedin.com/in/javiergarjim", github: "https://github.com/javiergarjim" )

	]

acolytes.each do |acolyte|
	acolyte.add_role :acolyte
end

