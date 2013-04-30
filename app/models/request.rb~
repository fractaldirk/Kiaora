class Request < ActiveRecord::Base
  attr_accessible :office, :request, :status, :user

  def office_name
    if office == 1
      "Belgium"
    elsif office == 99
      "Sample JD"
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
