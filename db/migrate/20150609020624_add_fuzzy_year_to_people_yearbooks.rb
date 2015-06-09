class AddFuzzyYearToPeopleYearbooks < ActiveRecord::Migration
  def change
    add_column :people_yearbooks, :fuzzy_year, :string #模糊日期的年的定义(年初，年中，年末......)
    add_column :people_yearbooks, :fuzzy_month, :string #模糊日期的月的定义(月初，月中，月末......)
    add_column :people_yearbooks, :fuzzy_day, :string #模糊日期的天得定义(凌晨，早上，中午......)
  end
end
