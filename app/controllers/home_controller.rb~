class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    redirect_to home_page
  end
  def GPI

  end

  def belgium
    @positions = Position.find(:all, :conditions => {:office => 1})
  end

  def database
    @positions = Position.find(:all)
  end

  def test

  end


private
  def home_page
    if current_user.office == 1
      belgium_path
    else
      home_index_path
    end
  end
end
