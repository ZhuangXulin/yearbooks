class AddIsfuzzydatequantumToPeopleYearbooks < ActiveRecord::Migration
  def change
    add_column :people_yearbooks, :isfuzzydatequantum, :boolean
    add_column :people_yearbooks, :fuzzy_date_quantum, :string
  end
end
