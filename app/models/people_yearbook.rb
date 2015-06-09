class PeopleYearbook < ActiveRecord::Base
  #mount_uploader :avatar, PictureUploader
  self.per_page = 15
  
  # Show one person's yearbooks
  #Request::
  # - page: now page number
  # - person_name: 
  def self.index(page,person_name)
    PeopleYearbook.paginate_by_sql("SELECT py.id,py.pdate,py.year,py.fuzzy_year,py.month,py.fuzzy_month,py.day,py.fuzzy_day,py.fuzzy_date_quantum,py.place,substring(py.event_description,1,55) as event_description FROM people_yearbooks as py,people as p where py.person_id = p.id and p.name = '#{person_name}' order by py.pdate,py.id", :page => page, :per_page => per_page)
  end
  
  # Show one yearbook
  #Request::
  #Return::
  def self.show(yearbook_id)
    if yearbook_id == nil
      yearbook_id = 'null'
    end
    PeopleYearbook.find_by_sql("SELECT (select name from people where id = person_id) as person_name,pdate,place,event_description,tag,year,fuzzy_year,month,fuzzy_month,day,fuzzy_day,fuzzy_date_quantum,created_at,updated_at FROM people_yearbooks as py WHERE py.id = #{yearbook_id}")
  end
  
end
