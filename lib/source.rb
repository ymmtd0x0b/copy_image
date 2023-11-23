require 'fileutils'
require 'progress_bar/core_ext/enumerable_with_progress'
require './lib/image_dir'

class Source
  attr_reader :dir

  def initialize(path)
    @dir = ImageDir.new(path)
  end

  def copy_images(dest)
    not_yet_copy_images = @dir.images - dest.old_dir.images
    not_yet_copy_images.each_with_progress(:bar, :percentage) do |image|
      FileUtils.copy(@dir.path(image), dest.new_dir.path, preserve: true)
    end
  end
end
