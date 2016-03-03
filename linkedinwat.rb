require 'linkedin_scraper'

profile = Linkedin::Profile.get_profile("http://www.linkedin.com/in/jeffweiner08")
puts profile.skills

require 'linkedin_scraper'
require 'ostruct'
# user = User.find_by(email: "leo@leo.com")

leo = {linked_in: "https://linkedin.com/in/leocc"}

chris = {linked_in: "https://www.linkedin.com/in/christian-oliver-b7366655"}

leo_profile = Linkedin::Profile.get_profile(leo[:linked_in])
chris_profile = Linkedin::Profile.get_profile(chris[:linked_in])

people = [chris_profile]

list_of_people = []
people.each do |profile|
  count = 0
  puts "Profile #{profile.first_name}"
  profile.skills.each do |skill|
    if leo_profile.skills.include?(skill)
      count += 1
    end
  end

  list_of_people << { count: count, profile: profile.first_name }
end

puts list_of_people.sort { |a, b| a[:count] <=> b[:count] }