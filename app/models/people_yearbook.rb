class PeopleYearbook < ActiveRecord::Base
  mount_uploader :avatar, PictureUploader
end
