class CreateCmsNews < ActiveRecord::Migration
  def change
    create_table :cms_news do |t|
      t.string :news_type
      t.string :title
      t.string :subtitle
      t.string :category
      t.string :slug, uniq: true, index: true
      t.date :date
      t.string :image
      t.string :abstract
      t.string :language
      t.text :description
      t.boolean :published
      t.boolean :highlight, default: false
      t.float :position

      t.timestamps
    end
  end
end
