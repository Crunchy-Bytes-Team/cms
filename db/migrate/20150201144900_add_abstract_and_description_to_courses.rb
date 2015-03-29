class AddAbstractAndDescriptionToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :abstract, :text
    add_column :courses, :description, :text
    add_column :courses, :image, :string
    add_column :courses, :highlight, :boolean, default: false
  end
end
