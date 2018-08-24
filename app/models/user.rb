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
end