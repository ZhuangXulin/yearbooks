class AddAttachmentPhotoToPeopleYearbooks < ActiveRecord::Migration
  def self.up
    change_table :people_yearbooks do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :people_yearbooks, :photo
  end
end
