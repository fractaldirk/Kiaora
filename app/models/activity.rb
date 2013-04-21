class Activity < ActiveRecord::Base
  attr_accessible :action, :content, :link, :office, :user_name
end
