class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @positions = Position.find(:all)
  end
  def GPI

  end

  def belgium
    @positions = Position.find(:all, :conditions => {:office => 1})
  end
end
