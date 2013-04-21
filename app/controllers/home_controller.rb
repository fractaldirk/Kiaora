class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  def index
    if user_signed_in?
      redirect_to home_page
    else
      redirect_to new_user_session_path
    end
  end
  def GPI
    @positions = Position.find(:all, :conditions => {:office => 99})
    @activities = Activity.find(:all, :conditions => {:office => 99}, :order => "created_at DESC", :limit => 10)
  end

  def belgium
    @positions = Position.find(:all, :conditions => {:office => 1})
    @activities = Activity.find(:all, :conditions => {:office => 1}, :order => "created_at DESC", :limit => 10)
  end

  def database
    @positions = Position.find(:all, :conditions => {:draft => 2})
    @samples = Position.find(:all, :conditions => {:office => 99, :draft => 2})
  end

  def activity
    @activities = Activity.find(:all, :order => "created_at DESC")
  end

  def requests

  end

private
  def home_page
    if current_user.office == 1
      belgium_path
    elsif current_user.office == 99
      home_GPI_path
    else
      home_index_path
    end
  end
end
