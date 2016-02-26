# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Proposal.create(
	name: "Building.co Rooftop garden", 
	description: "we want to create a site to promote our project where people can sign up to volunteer",
	timeline_days: 14,
	accepted_by: "christian",
	approval_status: nil
)

Proposal.create(
	name: "poorly worded project", 
	description: "we want to create a site to promote our project where people can sign up to volunteer",
	timeline_days: 14,
	accepted_by: "christian",
	approval_status: false
)

Proposal.create(
	name: "Well written project", 
	description: "we want to create a site to promote our project where people can sign up to volunteer",
	timeline_days: 14,
	accepted_by: "christian",
	approval_status: true
)
Proposal.create(
	name: "another crappy project", 
	description: "we want to create a site to promote our project where people can sign up to volunteer",
	timeline_days: 14,
	accepted_by: "christian",
	approval_status: false
)
Proposal.create(
	name: "this could be anything", 
	description: "we want to create a site to promote our project where people can sign up to volunteer",
	timeline_days: 14,
	accepted_by: "christian",
	approval_status: nil
)
