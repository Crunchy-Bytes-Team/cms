class CreateCmsUsers < ActiveRecord::Migration
  def up
    unless ActiveRecord::Base.connection.table_exists?(:cms_users)
      create_table :cms_users do |t|
        t.string :first_name
        t.string :last_name
        t.integer :role, default: 0
        t.timestamps
      end
    end
  end
  def down
    drop_table :cms_users
  end

end
