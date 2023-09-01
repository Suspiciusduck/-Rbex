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
    # Obtenez la liste des fichiers d'images dans le dossier app/assets/images
    image_files = Dir.glob(Rails.root.join('app', 'assets', 'images', '*'))

    # Sélectionnez un nombre aléatoire d'images (par exemple, 3 images)
    @random_images = image_files.sample(3) # Changez 3 en le nombre d'images souhaité
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
