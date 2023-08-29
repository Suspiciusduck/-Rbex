class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @adds = Add.all
  end
end
