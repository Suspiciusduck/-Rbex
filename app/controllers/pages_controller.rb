class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
  end

  def home
    @adds = Add.all
  end
end
