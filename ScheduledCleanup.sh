#!/bin/bash

TARGET_DIR="/path/to/your/dir"

LOG_FILE="$HOME/clear_folder.log"

if [ -d "$TARGET_DIR" ]; then
    # 删除7天前最后修改的文件或目录（不含 TARGET_DIR 本身）
    find "$TARGET_DIR" -mindepth 1 -mtime +7 -exec rm -rf {} +

    echo "Deleted files and directories older than 7 days in $TARGET_DIR at $(date)" >> "$LOG_FILE"
else
    echo "Directory $TARGET_DIR does not exist at $(date)" >> "$LOG_FILE"
fi
