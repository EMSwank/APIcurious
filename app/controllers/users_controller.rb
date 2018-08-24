class UsersController < ApplicationController
  def new
    @user = GithubUser.new(current_user)
  end
end