class CreateCmsMenus < ActiveRecord::Migration
  def up
    create_table :cms_menus do |t|
      t.string   :title
      t.string   :code
      t.float    :position
      t.boolean  :published,   default: true, null: false
      t.boolean  :main,       :default => false
      t.timestamps
    end
    add_index :cms_menus, :code, unique: true

    Cms::Menu.create_translation_table! :title => :string
  end

  def down
    Cms::Menu.drop_translation_table!
    drop_table :cms_menus
  end
end
