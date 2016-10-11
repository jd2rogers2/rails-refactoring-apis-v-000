class RepositoriesController < ApplicationController
  def index
    access_hash = {}
    access_hash["access_token"] = session[:token]
    git_serv = GithubService.new(access_hash)
    @repos_array = git_serv.get_repos
  end

  def create
    access_hash = {}
    access_hash["access_token"] = session[:token]
    git_serv = GithubService.new(access_hash)
    git_serv.create_repo(params[:name])
    redirect_to '/'
  end
end
