class CreateCmsTaxonomies < ActiveRecord::Migration
  def up
    create_table :cms_taxonomies do |t|
      t.string   :name
      t.string   :type
      t.float    :position,       default: 0.0,  null: false
      t.boolean  :published,      default: true, null: false
      t.timestamps
    end
    Cms::Taxonomy.create_translation_table! :name => :string
  end
end
