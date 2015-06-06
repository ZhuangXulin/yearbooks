class Person < ActiveRecord::Base
  self.per_page = 15
  
  # Show all person
  #Request::
  # - page: now page number
  # - search_key: person name
  def self.index(page,search_key)
    Person.where("name like ?","%#{search_key}%").paginate(:page => page, :per_page => per_page)
  end
end