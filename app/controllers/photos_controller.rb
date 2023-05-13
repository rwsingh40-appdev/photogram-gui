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
      input_image = params.fetch("Image")
      input_caption = params.fetch("Caption")
      input_owner_id = params.fetch("Owner ID")
      a_new_photo = Photo.new
      a_new_photo.image = input_image
      a_new_photo.caption = input_caption
      a_new_photo.owner_id = input_owner_id
      a_new_photo.save
      redirect_to("/photos/#{a_new_photo.id}")
    end
    def update
      target_photo_id = params.fetch("photo_id")
      updated_photo_image = params.fetch("Image")
      updated_photo_caption = params.fetch("Caption")
      target_photo = Photo.where({:id => target_photo_id}).first
      target_photo.image = updated_photo_image
      target_photo.caption = updated_photo_caption
      target_photo.save
      redirect_to("/photos/#{target_photo.id}")
      
    end

end
