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

    def delete
      target_id = params.fetch("photo_id").to_i
      target_photo = Photo.where({:id => target_id}).first
      target_photo.destroy
      redirect_to("/photos")
    end

    def create
      # target_id = params.fetch("photo_id").to_i
      # target_photo = Photo.where({:id => target_id}).first
      # target_photo.destroy
      # Parameters: {"Image"=>"a", "Caption"=>"b", "Owner ID"=>"c"}
      input_image = params.fetch("Image")
      input_caption = params.fetch("Caption")
      input_owner_id = params.fetch("Owner ID")
      a_new_photo = Photo.new
      a_new_photo.image = input_image
      a_new_photo.caption = input_caption
      a_new_photo.owner_id = input_owner_id
      a_new_photo.save
      # render({:template => "photo_templates/create.html.erb"})
      redirect_to("/photos/#{a_new_photo.id}")
    end

end
