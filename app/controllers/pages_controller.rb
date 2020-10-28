class PagesController < ApplicationController
  def home
  end

  def test
    @places = Place.where(user: current_user)
  end
end
