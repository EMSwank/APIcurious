require 'rails_helper'

describe "User" do
  context "visits user show page" do
    it "should see basic information--profil pic, number of starred repos, followers, following" do
      visit "/"
    end
  end
end


=begin Authenticate with my github account
View basic information about my account (profile pic, number of starred repos, followers, following)
View a summary feed of my recent activity (recent commits)
View a summary feed of recent activity from users whom I follow
View a list of organizations I’m a member of
View a list of my repositories
=end