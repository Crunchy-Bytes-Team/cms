class CreateCmsAssets < ActiveRecord::Migration
  def change
    create_table :cms_assets do |t|
      t.references :assetable
      t.string :assetable_type
      t.string :data
      t.string :title
      t.text   :abstract
      t.string :content_type
      t.string :file_size
      t.float :position
      t.boolean :published,       :default => true, :null => false
      t.string :url
      t.string :text_color
      t.string :type
      t.timestamps
    end
  end
end
