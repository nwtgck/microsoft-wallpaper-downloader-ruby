require './ms_wallpaper_downloader'

OUT_DIR_PATH  = "wallpapers" # TODO: Hard code
semaphore_num = 10 # TODO: Hard code
from_img_num  = 19000 # TODO: Hard code
to_img_num    = 19987 # TODO: Hard code

# Download wallpapers
MSWallpaperDownloader::download(
    OUT_DIR_PATH,
    semaphore_num,
    from_img_num,
    to_img_num
)