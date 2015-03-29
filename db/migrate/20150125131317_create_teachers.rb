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
      t.string :curriculum_it
      t.string :curriculum_en
      t.string :activity_document_it
      t.string :activity_document_en
      t.float :position
      t.boolean :published,       :default => true, :null => false
      t.timestamps
    end
  end
end
