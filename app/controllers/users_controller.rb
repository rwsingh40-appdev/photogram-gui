class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order({:username => :asc})

    render({:template => "user_templates/index.html.erb"})
  end

  def show
    @user_string = params.fetch("username") 
    @user = User.where({:username => @user_string}).first
    render({:template => "user_templates/show.html.erb"})
  end

end
