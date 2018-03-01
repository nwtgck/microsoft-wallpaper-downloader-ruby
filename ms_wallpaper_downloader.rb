require 'open-uri'
require 'thread'

module MSWallpaperDownloader
    def self.download(outdir_path, semaphore_num, from_img_num, to_img_num)
        # If no directory
        if !Dir.exists?(outdir_path)
            # Make the directory
            Dir.mkdir(outdir_path)
        end

        # for counting semaphore (from: https://qiita.com/na-o-ys/items/62e9abc21c236908c958#_reference-d496b8cc1d1f2cc3e9e8)
        locks = Queue.new
        semaphore_num.times { locks.push :lock }

        (from_img_num...to_img_num).map{|img_num|
            Thread.new do
                # for counting semaphore
                lock = locks.pop

                # Get image URL
                img_url = "https://kbdevstorage1.blob.core.windows.net/asset-blobs/#{img_num}_en_1"

                # Out file name
                out_file_name = "wallpaper#{img_num}.jpg"

                # Save a wallpaper as an image
                IO.copy_stream(
                    open(img_url),
                    open(File.join(outdir_path, out_file_name), 'wb')
                )

                puts("#{img_num} Done!")
                
                # for counting semaphore
                locks.push lock 
            end
        }.each(&:join)
    end
end