class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @positions = Position.find(:all)
  end
  def GPI

  end
end
