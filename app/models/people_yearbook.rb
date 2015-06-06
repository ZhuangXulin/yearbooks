class PeopleYearbook < ActiveRecord::Base
  mount_uploader :avatar, PictureUploader
  self.per_page = 15
  
  
  # Show one person's yearbooks
  #Request::
  # - page: now page number
  # - person_name: 
  def self.index(page,person_name)
    PeopleYearbook.paginate_by_sql("SELECT py.* FROM people_yearbooks as py,people as p where py.person_id = p.id and p.name = '#{person_name}' order by py.pdate", :page => page, :per_page => per_page)
  end
end
