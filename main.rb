require './lib/dotenv'
require './lib/source'
require './lib/destination'

def main
  include DOTENV
  DOTENV.load

  dest = Destination.new(ENV['DESTINATION'])
  dest.create_sub_dirs

  if dest.new_dir.present?
    puts '移動済みの画像を整理しています...'
    dest.organize_images
  end

  src = Source.new(ENV['SOURCE'])

  if src.dir.images.difference(dest.old_dir.images).length > 0
    puts '画像をコピーしています...'
    src.copy_images(dest)
  else
    puts 'コピーが必要な画像はありませんでした'
  end
end

main
