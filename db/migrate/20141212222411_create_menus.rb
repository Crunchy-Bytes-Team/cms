class CreateMenus < ActiveRecord::Migration
  def up
    create_table :menus do |t|
      t.string   :title
      t.string   :code
      t.float    :position
      t.boolean  :published,   default: true, null: false
      t.boolean  :main,       :default => false
      t.timestamps
    end
    add_index :menus, :code, unique: true

    Menu.create_translation_table! :title => :string
  end

  def down
    Menu.drop_translation_table!
    drop_table :menus
  end
end
