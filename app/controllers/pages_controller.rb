class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  layout "home"

  def home
    @places = Place.all.sample(9)
  end
end
