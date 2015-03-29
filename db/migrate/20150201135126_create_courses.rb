class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.date :starts_at
      t.date :ends_at
      t.text :timing_frequency
      t.text :location
      t.float :latitude
      t.float :longitude
      t.text :price
      t.text :subscription
      t.integer :duration
      t.string :kind
      t.boolean :published,       :default => true, :null => false
      t.float :position
      t.timestamps
    end
  end
end
