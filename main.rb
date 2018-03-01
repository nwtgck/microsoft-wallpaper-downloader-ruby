require 'optparse'
require './ms_wallpaper_downloader'

options = {
    outdir_path:   "wallpapers",
    semaphore_num: 10,
    from_img_num:  19000,
    to_img_num:    19987
}
OptionParser.new do |opts|
  opts.banner = "Usage: bundle exec ruby main.rb [options]"

  opts.on("--outdir=DIR_PATH", String, "Path of output directory (default: #{options[:outdir_path].inspect})") do |v|
    options[:outdir_path] = v
  end

  opts.on("--semaphore-num=NUM", Integer, "The number of semaphores for concurrent download (default: #{options[:semaphore_num].inspect})") do |v|
    options[:semaphore_num] = v
  end

  opts.on("--from-num=NUM", Integer, "From-image number (default: #{options[:from_img_num].inspect})") do |v|
    options[:from_img_num] = v
  end
    
  opts.on("--to-num=NUM", Integer, "To-image number (default: #{options[:to_img_num].inspect})") do |v|
    options[:to_img_num] = v
  end

end.parse!

outdir_path   = options[:outdir_path]
semaphore_num = options[:semaphore_num]
from_img_num  = options[:from_img_num]
to_img_num    = options[:to_img_num]

# Download wallpapers
MSWallpaperDownloader::download(
    outdir_path,
    semaphore_num,
    from_img_num,
    to_img_num
)