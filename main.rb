require 'open-uri'

OUT_DIR_PATH = "wallpapers"

# If no directory
if !Dir.exists?(OUT_DIR_PATH)
    # Make the directory
    Dir.mkdir(OUT_DIR_PATH)
end


(19000...19987).each{|img_num| # TODO: Hard code
    # Get image URL
    img_url = "https://kbdevstorage1.blob.core.windows.net/asset-blobs/#{img_num}_en_1"

    # Out file name
    out_file_name = "wallpaper#{img_num}.jpg"

    puts("Downloading #{img_num} ...")

    # Save a wallpaper as an image
    IO.copy_stream(
        open(img_url),
        open(File.join(OUT_DIR_PATH, out_file_name), 'wb')
    )
}

