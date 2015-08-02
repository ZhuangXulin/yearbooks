class RemovePdateToYearbooks < ActiveRecord::Migration
  def change
    remove_column :people_yearbooks, :pdate
  end
end
