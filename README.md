# Wallpaper Downloader of Microsoft
[![Build Status](https://travis-ci.org/nwtgck/microsoft-wallpaper-downloader-ruby.svg?branch=master)](https://travis-ci.org/nwtgck/microsoft-wallpaper-downloader-ruby)

A wallpaper downloader of beautiful images in Microsoft

![demo1](demo_images/demo1.gif)

## Run

```
bundle install
bundle exec ruby main.rb 
```

Then you will have wallpapers in `wallpapers` directory.

## Options' Help

Here is available options.

```txt
Usage: bundle exec ruby main.rb [options]
        --outdir=DIR_PATH            Path of output directory (default: "wallpapers")
        --semaphore-num=NUM          Semaphore number for concurrent download (default: 10)
        --from-num=NUM               From-image number (default: 19000)
        --to-num=NUM                 To-image number (default: 19987)
```

## Wallpaper Source

Microsoft has very beautiful wallpapers here.  
<https://support.microsoft.com/en-us/help/17780/featured-wallpapers>