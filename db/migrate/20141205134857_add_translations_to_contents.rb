class AddTranslationsToContents < ActiveRecord::Migration
  def up
    Cms::Content.create_translation_table! :title => :string, :slug => :string, :abstract => :text, :description => :text
  end

  def down
    Cms::Content.drop_translation_table!
  end
end
