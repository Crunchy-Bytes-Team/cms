class CreateCmsContents < ActiveRecord::Migration

  def change
    create_table :cms_contents do |t|
      t.string :name
      t.string :title
      t.string :subtitle
      t.string :slug, uniq: true, index: true
      t.string :code, uniq: true, index: true
      t.text :abstract
      t.text :description
      t.references :content, index: true
      t.string  :image
      t.text :extra_fields
      t.string :type
      t.float :position
      t.boolean :published, :default => true, :null => false
      t.string :language

      t.timestamps
    end
  end

end
