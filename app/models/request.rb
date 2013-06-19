class Request < ActiveRecord::Base
  attr_accessible :office, :request, :status, :user

  def office_name
    if office == 1
      "Belgium"
    elsif office == 99
      "Sample JD"
    elsif office == 2
      "France"
    elsif office == 3
      "Mediterranean"
    elsif office == 4
      "Greece"
    elsif office == 5
      "New Zealand"
    elsif office == 6
      "Germany"
    # example offices for test round (skillshare) June
    elsif office == 7
      "Office A"
    elsif office == 8
      "Office B"
    else
      "To be defined"
    end
  end

  def status_outcome
    if status == 1
      "Pending"
    elsif status == 2
      "Accepted"
    elsif status == 3
      "Rejected"
    else
      "Extinct"
    end
  end
end
