class AddTagToPeopleYearbooks < ActiveRecord::Migration
  def change
    add_column :people_yearbooks, :tag, :string  #标签
    add_column :people_yearbooks, :isfuzzydate, :boolean #是否是模糊日期，yes:模糊如期,false:精准日期
    add_column :people_yearbooks, :year, :string #模糊日期的年
    add_column :people_yearbooks, :month, :string #模糊日期的月
    add_column :people_yearbooks, :day, :string #模糊日期的天
  end
end
