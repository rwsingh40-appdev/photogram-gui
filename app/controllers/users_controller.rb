class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order({:username => :asc})

    render({:template => "user_templates/index.html.erb"})
  end
end
