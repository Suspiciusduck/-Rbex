class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @image_url = fetch_random_image
  end

  def home
    @adds = Add.all
  end
end
