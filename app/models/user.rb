class User < ApplicationRecord

  def self.from_omniauth(auth)
    create! do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.name = auth[:info][:name]
      user.nickname = auth[:info][:nickname]
      user.token = auth[:credentials][:token]
      user.avatar_url = auth[:extra][:raw_info][:avatar_url]
      user.follower_count = auth[:extra][:raw_info][:followers]
      user.following_count = auth[:extra][:raw_info][:following]
    end
  end

#   def commit_count
#     conn = Faraday.new(url: "https://api.github.com/users/#{nickname}/events")
#     response = conn.get do |req|
#       req.headers['Authorizations'] = ENV['token']
#     end
#     search = JSON.parse(response.body, symbolize_names: true)
#     events = search.find_all do |event|
#       event[:type] == 'Pushes'
#     end

#     push_events = events.map do |raw_event|
#       Pushes.new(raw_event)
#     end
#     push_events.sum(&:commit_count)
#   end

#   def recent_repos
#     github_service.get_url("users/#{nickname}/repos").map do |raw_repo|
#       Repo.new(raw_repo)
#     end
#   end
  
end