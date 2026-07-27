#!/bin/bash
ffmpeg -i in.mp4 -i out.mp4 -map 1 -map_metadata 0 -c copy fixed.mp4