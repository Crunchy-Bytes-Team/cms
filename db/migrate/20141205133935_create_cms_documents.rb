class CreateCmsDocuments < ActiveRecord::Migration
  def change
    create_table :cms_documents do |t|
      t.references :documentable
      t.string :title
      t.string :documentable_type
      t.string :data
      t.string :content_type
      t.string :file_size
      t.float :position
      t.boolean :published,       :default => true, :null => false
      t.string :url

      t.timestamps
    end
  end
end
