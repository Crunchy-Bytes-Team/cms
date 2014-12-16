class AddCmsTranslationsToBlocks < ActiveRecord::Migration
  def up
    Cms::Block.create_translation_table! :title => :string, :subtitle => :string, :abstract => :text, :description => :text
  end

  def down
    Cms::Block.drop_translation_table!
  end
end
