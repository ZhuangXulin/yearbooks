class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :person_id    #用户id
      t.integer :person_yearbook_id   #用户事件id
      t.string :picture_url     #图片的访问地址

      t.timestamps null: false
    end
  end
end
