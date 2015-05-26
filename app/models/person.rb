class Person < ActiveRecord::Base
  
  def self.find_types
    Person.find(:all, :order => 'tp').collect{ |type|[type.tp,type.id]}
  end
end
