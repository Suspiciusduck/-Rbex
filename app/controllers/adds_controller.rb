class AddsController < ApplicationController
  def index
    if params[:query].present?
      @adds = Add.search_by_city(params[:query])
    else
      @adds = Add.all
    end
  end

  def show
    @add = Add.find(params[:id])
    @markers = [@add].map do |add|
      {
        lat: add.latitude,
        lng: add.longitude
      }
    end
    random_images
  end

  def new
    @add = Add.new
  end

  def create
    @add = Add.new(add_params)
    @add.user = current_user
    if @add.save!
      redirect_to add_path(@add)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def random_images
    cloudinary_folder = "Rbex"
    folder_resources = Cloudinary::Api.resources(type: "upload", prefix: cloudinary_folder)

    if folder_resources["resources"].empty?
      # Gérer le cas où il n'y a pas d'images, par exemple en affichant un message d'erreur
      @random_images = []
    else
      # Sélectionnez un nombre aléatoire d'images
      @random_images = folder_resources["resources"].sample(10)
    end
  end

  def edit
    @add = Add.find(params[:id])
  end

  def update
    @add = Add.find(params[:id])
    @add.update(add_params)
    redirect_to add_path(@add)
  end

  def destroy
    @add = Add.find(params[:id])
    @add.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def add_params
    params.require(:add).permit(:title, :description, :availability, :price, :city, :photo)
  end
end
