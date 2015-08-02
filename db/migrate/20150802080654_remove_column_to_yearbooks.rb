class RemoveColumnToYearbooks < ActiveRecord::Migration
  def change
    remove_column :people_yearbooks, :isfuzzydate
    remove_column :people_yearbooks, :year
    remove_column :people_yearbooks, :month
    remove_column :people_yearbooks, :day
    remove_column :people_yearbooks, :fuzzy_year
    remove_column :people_yearbooks, :fuzzy_month
    remove_column :people_yearbooks, :fuzzy_day
    remove_column :people_yearbooks, :isfuzzydatequantum
    remove_column :people_yearbooks, :fuzzy_date_quantum
    
    add_column :people_yearbooks, :event_date, :string  #时间时间
  end
end
