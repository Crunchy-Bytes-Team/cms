class AddCmsTranslationsToNews < ActiveRecord::Migration
  def up
    Cms::News.create_translation_table!({
      :title => :string,
      :subtitle => :string,
      :slug => :string,
      :abstract => :string,
      :description => :text})
  end

  def down
    Cms::News.drop_translation_table!
  end
end
