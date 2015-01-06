class AddTranslationsToLaunches < ActiveRecord::Migration
  def up
    Cms::Launch.create_translation_table! :title => :string, :subtitle => :string
  end

  def down
    Cms::Launch.drop_translation_table!
  end
end

