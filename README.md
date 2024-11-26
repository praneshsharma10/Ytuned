# Shell Based Audio Downloader Script

A Bash script to download audio from YouTube videos in MP3 format using `yt-dlp`.

## Features

- Downloads audio from YouTube videos in MP3 format.
- Allows you to specify a custom output directory or use a default directory.
- Optionally adds metadata (e.g., title, artist) to the downloaded audio file.
- 
---

## Requirements

1. **yt-dlp**  
   Install it using:
   ```bash
   sudo apt install yt-dlp
   ```

2. **ffmpeg**  
   Install it using:
   ```bash
   sudo apt install ffmpeg
   ```

---

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/praneshsharma10/Ytuned.git
   cd Ytuned
   ```

2. Make the script executable:
   ```bash
   chmod +x yt_mp3.sh
   ```

---

## Run

1. Run the script:
   ```bash
   ./yt_mp3.sh
   ```

2. Follow the prompts:
   - Enter the YouTube URL of the video you want to download.
   - Specify an output directory (optional; press Enter to use the default directory: `/home/pranesh/SHELL/Scripts/yt/downloaded_files`).
   - Optionally add metadata (title and artist) to the audio file.
