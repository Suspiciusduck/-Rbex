class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
  end

  def home
    @adds = Add.order(id: :asc)
    random_images
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
end
