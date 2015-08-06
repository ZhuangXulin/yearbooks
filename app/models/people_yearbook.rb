class PeopleYearbook < ActiveRecord::Base
  #mount_uploader :avatar, PictureUploader
  self.per_page = 15
  belongs_to :category
  has_attached_file :photo,
                    :styles => { :medium => "300x300>",  
                                 :thumb => "100x100>" },
                    :url => "/people_yearbooks/:attachment/:id/:style/:basename.:extension",    
                    :path => ":rails_root/public/people_yearbooks/:attachment/:id/:style/:basename.:extension"
                    
  validates_attachment_presence :photo    
  validates_attachment_size :photo, :less_than => 5.megabytes    
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  # Show one person's yearbooks
  #Request::
  # - page: now page number
  # - person_name: 
  def self.index(page,person_name)
    PeopleYearbook.paginate_by_sql("SELECT py.id,py.event_date,py.place,substring(py.event_description,1,55) as event_description FROM people_yearbooks as py,people as p where py.person_id = p.id and p.name = '#{person_name}' order by py.event_date,py.id", :page => page, :per_page => per_page)
  end
  
  # Show one yearbook
  #Request::
  #Return::
  def self.show(yearbook_id)
    if yearbook_id == nil
      yearbook_id = 'null'
    end
    PeopleYearbook.find_by_sql("SELECT (select name from people where id = person_id) as person_name,event_date,place,event_description,tag,created_at,updated_at FROM people_yearbooks as py WHERE py.id = #{yearbook_id}")
  end
  
  # Show one person's yearbook
  def self.index_contrast(person_name)
    PeopleYearbook.find_by_sql("SELECT py.id,py.event_date,py.place,substring(py.event_description,1,55) as event_description FROM people_yearbooks as py,people as p where py.person_id = p.id and p.name = '#{person_name}' order by py.event_date,py.id");
  end
  
end
