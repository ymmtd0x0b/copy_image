require 'fileutils'
require 'progress_bar/core_ext/enumerable_with_progress'
require './lib/image_dir'

class Destination
  attr_reader :new_dir, :old_dir

  def initialize(path)
    @old_dir = ImageDir.new(path, '過去の画像')
    @new_dir = ImageDir.new(path, '最新の画像')
  end

  def create_sub_dirs
    @old_dir.create if @old_dir.not_exist?
    @new_dir.create if @new_dir.not_exist?
  end

  def organize_images
    @new_dir.images_path.each_with_progress(:bar, :percentage) do |image_path|
      FileUtils.mv image_path, @old_dir.path
    end
  end
end
