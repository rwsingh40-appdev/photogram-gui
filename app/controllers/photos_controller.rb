class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order({:created_at => :desc})
    render({:template => "photo_templates/index.html.erb"})
  end

  def show

    @photo_id = params.fetch("photo_id").to_i
    @photo = Photo.where({:id => @photo_id}).first
    render({:template => "photo_templates/show.html.erb"})
  end

end
