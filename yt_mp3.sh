#!/bin/bash

# Function to check dependencies
check_dependencies() {
    if ! command -v yt-dlp &> /dev/null; then
        echo "Error: yt-dlp is not installed. Install it using 'sudo apt install yt-dlp'."
        exit 1
    fi

    if ! command -v ffmpeg &> /dev/null; then
        echo "Error: ffmpeg is not installed. Install it using 'sudo apt install ffmpeg'."
        exit 1
    fi
}

# Function to download video and extract audio
download_audio() {
    echo "Enter the YouTube URL:"
    read -r url

    # Define the default directory
    default_dir="/home/pranesh/SHELL/Scripts/yt/downloaded_files"
    
    echo "Enter the output directory (default is $default_dir):"
    read -r output_dir
    output_dir=${output_dir:-$default_dir}

    echo "The files will be saved in: $output_dir"

 #   echo "Do you want to add metadata? (yes/no):"
 #   read -r add_metadata

    # Set output template
    output_template="$output_dir/%(title)s.%(ext)s"

    # Download video and extract audio
    yt-dlp --extract-audio --audio-format mp3 --output "$output_template" "$url"

    if [ "$add_metadata" = "yes" ]; then
        echo "Enter the Title:"
        read -r title

        echo "Enter the Artist:"
        read -r artist

        # Apply metadata using ffmpeg
        audio_file=$(find "$output_dir" -type f -name "*.mp3" -print0 | xargs -0 ls -t | head -n 1)
        ffmpeg -i "$audio_file" -metadata title="$title" -metadata artist="$artist" -c copy "${audio_file%.mp3}-meta.mp3"

        echo "Metadata added. File saved as: ${audio_file%.mp3}-meta.mp3"
    else
        echo "Audio file downloaded"
    fi

    echo "The downloaded file is saved in: $output_dir"
}

# Main Script
check_dependencies
download_audio

