require 'fileutils'

class ImageDir
  def initialize(base_dir, name = nil)
    @path = [base_dir, name].compact.join('/')
  end

  def create
    Dir.mkdir(@path, 0777)
  end

  def images
    begin
      Dir.children @path
    rescue => e
      nil
    end
  end

  def images_path
    images.map do |images|
      [@path, images].join('/')
    end
  end

  def path(image = nil)
    [@path, image].compact.join('/')
  end

  def not_exist?
    !Dir.exist? @path
  end

  def present?
    !Dir.empty? @path
  end
end
