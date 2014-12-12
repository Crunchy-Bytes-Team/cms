class CreateCmsBlocks < ActiveRecord::Migration
  def change
    create_table :cms_blocks do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.text :abstract
      t.string :type #used in case of STI
      t.string :block_type
      # serialized fiels
      t.text :extra_fields
      # targetable fields
      t.string :target_type
      t.integer :target_id
      t.string :target_url
      t.string :target_mode
      t.string :anchor_name

      t.references :content, index: true
      t.boolean :published,       :default => true, :null => false
      t.float :position
      t.timestamps
    end
  end
end
