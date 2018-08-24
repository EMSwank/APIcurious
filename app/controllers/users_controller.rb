class UsersController < ApplicationController
  def new
    binding.pry
    @user = GithubUser.new(current_user.nickname)
  end
end