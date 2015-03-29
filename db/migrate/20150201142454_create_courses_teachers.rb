class CreateCoursesTeachers < ActiveRecord::Migration
  def change
    create_table :courses_teachers do |t|
      t.integer :course_id
      t.integer :teacher_id
      t.timestamps
    end
    add_index :courses_teachers, [:course_id,:teacher_id], unique: true
  end
end
