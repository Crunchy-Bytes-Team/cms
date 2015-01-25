class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :qualification
      t.string :affiliation
      t.string :picture
      t.string :kind
      t.text :bio
      t.string :interest_areas
      t.float :position
      t.boolean :published,       :default => true, :null => false
      t.timestamps
    end
  end
end
