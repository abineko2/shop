class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def week
    first = Date.today
    last = first+6
    return first,last
  end  
end
