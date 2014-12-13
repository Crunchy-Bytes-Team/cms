class CreateCmsSections < ActiveRecord::Migration
  def up
    create_table :cms_sections do |t|
      t.string   :name
      t.string :slug, uniq: true, index: true
      t.string :code, uniq: true, index: true
      t.float    :position,       default: 0.0,  null: false
      t.boolean  :published,      default: false, null: false
      t.timestamps
    end
    Cms::Section.create_translation_table! :name => :string, :slug => :string
  end
end
