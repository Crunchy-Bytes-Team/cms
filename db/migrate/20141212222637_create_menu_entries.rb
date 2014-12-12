class CreateMenuEntries < ActiveRecord::Migration
  def up
    create_table :menu_entries do |t|
      t.string   :title
      t.float    :position
      t.boolean  :published
      t.integer  :menu_id
      t.string   :anchor
      t.string   :target_type
      t.integer  :target_id
      t.string   :target_url
      t.string   :target_mode
      t.string   :destination
      t.timestamps
    end

    MenuEntry.create_translation_table! :title => :string
  end

  def down
    MenuEntry.drop_translation_table!
    drop_table :menu_entries
  end
end
