# encoding: utf-8
class ImageUploader < ::CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "system/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def scale(width, height)
    resize_to_fill width, height
  end

  version :admin_thumb do
    process resize_to_fit: [100, 150]
  end

  version :wide do
    process resize_to_fit: [1280, 390]
  end

  version :box do
    process resize_to_fit: [400, 400]
  end

  version :vertical_box do
    process resize_to_fill: [570, 700]
  end

  version :common_hero do
    process resize_to_fill: [1280, 410]
  end

  version :tile_view do
    process resize_to_fill: [300, 200]
  end

  version :article_thumb do
    process resize_to_fill: [390, 300]
  end

  version :home_hero do
    process resize_to_fill: [1280, 600]
  end

  version :float_block_image do
    process resize_to_fill: [720, 500]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
