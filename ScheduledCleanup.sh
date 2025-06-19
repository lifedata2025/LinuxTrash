#!/bin/bash

# 垃圾桶
TRASH_DIR=~/.trash

# 如果不存在垃圾桶
if [ ! -d "$TRASH_DIR" ]; then
    mkdir -p "$TRASH_DIR"
fi

LOG_FILE="$TRASH_DIR/scheduledCleanup.log"

# 需要删除多久（天）以前的文件，根据需求修改
if [ -d "$TRASH_DIR" ]; then
    # 删除7天前最后修改的文件
    find "$TARGET_DIR" -type f -mtime +7 -delete
    echo "Deleted files older than 7 days in $TARGET_DIR at $(date)" >> "$LOG_FILE"
    # 删除7天前最后修改的目录
    find "$TARGET_DIR" -type d -mtime +7 -exec /bin/rm -rf {} +
    echo "Deleted directories older than 7 days in $TARGET_DIR at $(date)" >> "$LOG_FILE"
else
    echo "Directory $TARGET_DIR does not exist at $(date)" >> "~/err.log"
fi
