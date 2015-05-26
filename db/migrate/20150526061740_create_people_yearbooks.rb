class CreatePeopleYearbooks < ActiveRecord::Migration
  def change
    create_table :people_yearbooks do |t|
      t.integer :person_id    #用户id
      t.date :pdate           #时间
      t.string :place         #地点
      t.text :event_description  #事件说明
      
      t.timestamps null: false
    end
  end
end