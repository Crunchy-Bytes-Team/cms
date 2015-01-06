class CreateCmsLaunches < ActiveRecord::Migration
  def change
    create_table :cms_launches do |t|
      t.string    :title
      t.string    :subtitle

      # targetable fields
      t.string    :target_type
      t.integer   :target_id
      t.string    :target_url
      t.string    :target_mode
      t.string    :anchor_name

      t.string    :target_label
      t.string    :attachment
      t.string    :attachment_title
      t.integer   :position
      t.boolean   :published
      t.string    :type
      t.string    :background_image
      t.string    :image

      t.text      :description
      t.boolean   :highlight,         default: false
      t.boolean   :dark_background,   default: false
      t.boolean   :hide_caption,      default: false
      t.string    :button_color
      t.string    :button_text_color

      t.string    :language
      t.timestamps
    end
  end
end
