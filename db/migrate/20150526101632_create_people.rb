class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name            #姓名
      t.text :bio               #简介
      t.string :nationality     #国籍
      t.string :birthplace      #出生地
      t.string :date_of_birth     #出生日期
      t.string :date_of_death     #逝世日期
      t.string :occupation      #职业
      t.string :wikipedia_url   #维基百科地址
      t.string :baike_url       #百度百科地址
      
      t.timestamps null: false
    end
  end
end
