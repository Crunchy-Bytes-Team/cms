class RemoveAttributesFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :timing_frequency
    remove_column :courses, :price
    remove_column :courses, :subscription
  end
end
