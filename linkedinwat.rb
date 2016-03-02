require 'linkedin_scraper'

profile = Linkedin::Profile.get_profile("http://www.linkedin.com/in/jeffweiner08")
puts profile.skills