class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    git_serv = GithubService.new
    session[:token] = git_serv.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])
    session[:username] = git_serv.get_username
    redirect_to '/'
  end
end