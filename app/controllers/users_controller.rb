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

  def create
   input_username = params.fetch("input_username")
   a_new_user = User.new
   a_new_user.username = input_username
   a_new_user.save
   redirect_to("/users/#{a_new_user.username}")
  end

  def update
    user_id = params.fetch("user_id")
    updated_username = params.fetch("updated_username")
    user_to_update = User.where({:id => user_id}).first
    user_to_update.username = updated_username
    user_to_update.save
    redirect_to("/users/#{user_to_update.username}")
  end

end
