require 'linkedin_scraper'

class Team < ActiveRecord::Base
	belongs_to :project

	def generate_team_member_list(team_lead)
			people = get_jrdevs
			team_lead_profile = Linkedin::Profile.get_profile(team_lead.linkedin)
			list_of_devs = []
			people.each do |person|
				  puts "--------------************------"
				  puts person.name
				  puts person.linkedin
				  profile = Linkedin::Profile.get_profile(person.linkedin)
				  count = 0
				  puts "Profile #{profile.first_name}"
				  profile.skills.each do |skill|
				    if team_lead_profile.skills.include?(skill)
				      count += 1
				    end
				  end
				  list_of_devs << { count: count, profile: profile.first_name, user_id: person.id}
				end

			sorted_list = list_of_devs.sort { |a, b| a[:count] <=> b[:count] }
			final_list = []
			sorted_list.each do |person|
				user = User.find_by(id: person[:user_id])
				final_list.push(user)
			end

			return final_list.first(10)
		end

		def get_jrdevs
			@users = User.all
			jrdevs = [] 
			@users.each do |user|
				if user.linkedin != nil && user.has_role?(:acolyte) && user.team_id == nil
					jrdevs.push(user)
				end
			end
			return jrdevs
		end	
end
