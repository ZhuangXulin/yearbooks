class PeopleYearbook < ActiveRecord::Base
  #mount_uploader :avatar, PictureUploader
  self.per_page = 15
  
  # Show one person's yearbooks
  #Request::
  # - page: now page number
  # - person_name: 
  def self.index(page,person_name)
    PeopleYearbook.paginate_by_sql("SELECT py.* FROM people_yearbooks as py,people as p where py.person_id = p.id and p.name = '#{person_name}' order by py.pdate", :page => page, :per_page => per_page)
  end
  
  # Show one yearbook
  #Request::
  #Return::
  def self.show(yearbook_id)
    if yearbook_id == nil
      yearbook_id = 'null'
    end
    PeopleYearbook.find_by_sql("SELECT (select name from people where id = person_id) as person_name,pdate,place,event_description,tag,year,month,day,created_at,updated_at FROM people_yearbooks as py WHERE py.id = #{yearbook_id}")
  end
  
end
