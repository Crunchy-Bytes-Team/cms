class AddTranslationsToCourses < ActiveRecord::Migration
  def up
    Course.create_translation_table! :title => :string,:abstract => :text, :description => :text, :slug => :string, :timing_frequency => :text, :location => :text
  end

  def down
    Course.drop_translation_table!
  end
end


