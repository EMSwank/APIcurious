require 'rails_helper'

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = 
    OmniAuth::AuthHash.new(
      {
      "uid"=>"31110190",
      "info"=>
        {"nickname"=>"EMSwank",
        "email"=>"eliotswank@gmail.com",
        "name"=>"Eliot Swank",
        "image"=>"https://avatars1.githubusercontent.com/u/31110190?v=4",
        "urls"=>{"GitHub"=>"https://github.com/EMSwank", "Blog"=>""}},
      "credentials"=>{"token"=>ENV['TOKEN'], "expires"=>false},
      "extra"=>
        {"raw_info"=>
          {
          "avatar_url"=>"https://avatars1.githubusercontent.com/u/31110190?v=4",
          "public_repos"=>55,
          "public_gists"=>8,
          "followers"=>2,
          "following"=>1,
          }
        }
      }
    )
end

feature "User sees basic info" do
  include Capybara::DSL
  before(:each) do
    Capybara.app = Apicurious::Application
    stub_omniauth
  end

  scenario 'User sees profile pic, num of starred repos, followers, following' do
    visit root_path
    expect(page.status_code).to eq(200)

    click_link "Sign in with Github"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Eliot")
    expect(page).to have_link("Log out")
    expect(page).to have_content(stub_omni[:extra][:raw_info][:avatar_url])
  end
end
=begin Authenticate with my github account
View basic information about my account (profile pic, number of starred repos, followers, following)
View a summary feed of my recent activity (recent commits)
View a summary feed of recent activity from users whom I follow
View a list of organizations I’m a member of
View a list of my repositories
=end