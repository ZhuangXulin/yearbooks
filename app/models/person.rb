class Person < ActiveRecord::Base
  self.per_page = 15
  belongs_to :category
  has_attached_file :photo,
                    :styles => { :medium => "300x300>",  
                                 :thumb => "100x100>" },
                    :url => "/people/:attachment/:id/:style/:basename.:extension",    
                    :path => ":rails_root/public/people/:attachment/:id/:style/:basename.:extension"
                    
  validates_attachment_presence :photo    
  validates_attachment_size :photo, :less_than => 5.megabytes    
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  # Show all person
  #Request::
  # - page: now page number
  # - search_key: person name
  def self.index(page,search_key)
    Person.where("name like ?","%#{search_key}%").paginate(:page => page, :per_page => per_page)
  end
end