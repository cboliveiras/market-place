class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @places = Place.all
    render pages: 'home'
  end
end
