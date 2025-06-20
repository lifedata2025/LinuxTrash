[English](./README.md)

# LinuxTrash

`LinuxTrash` 是一个安全替代 `rm` 的工具，用于安全处理文件和目录，执行 `rm` 会将它们移动到垃圾桶里 `~/.trash` ，而不是永久删除。

如果你按照下述方法使用了 `LinuxTrash` ，本质上 `rm` 的操作不再是 `rm` ，而是 `mv` 。`LinuxTrash` 帮你完成了移至垃圾桶的操作，请您知悉这一点！


## 安装

1. 下载 `LinuxTrash` 文件至用户目录

此脚本说明默认您安装在家目录home，可根据实际情况自己修改脚本路径。

```bash
git clone https://github.com/lifedata2025/LinuxTrash

or


```

2. 给安装路径 `/your/path/to` 上的脚本加执行权限
```bash
chmod +x ~/LinuxTrash/trash.sh
chmod +x ~/LinuxTrash/scheduledCleanup.sh
```

3. 在 `.bashrc` 或 `.zshrc` 中添加别名 (可以不是 `rm` )
```bash
echo 'alias rm="~/LinuxTrash/trash.sh"' >> ~/.bashrc
source ~/.bashrc
```


## 用法
### 将文件或目录“删除”

要将文件或目录移动到垃圾桶，像往常一样使用 `rm` 命令：
```bash
rm file1 file2 directory1
```
默认“删除”前，您不会收到确认提示。

### 确认操作（如删除前需要确认，请将此处取消多行注释）

打开 `~/LinuxTrash/trash.sh` 并取消以下注释，这样您在删除前会收到确实提示。

```bash
echo -n "Are you sure you want to move the above items to the trash? [Y/N]: "
read -r CONFIRM_MOVE
if [ "$CONFIRM_MOVE" != "Y" ] && [ "$CONFIRM_MOVE" != "y" ]; then
    echo "Operation cancelled."
    exit 0
fi
```

### 清空垃圾桶

**清空垃圾桶调用的是 `/bin/rm` 并加上 `-rf` 参数来清空 `~/.trash` 文件夹。此操作不可逆。**

要清空垃圾桶，请使用 `-c` 参数：
```bash
rm -c
```
垃圾桶会被您清空，并被提示确认清空操作。

### 定时自动清空
如果你希望垃圾桶实现自动清空

1. 打开定时任务编辑器：

```bash
crontab -e
```

2 设置定时任务（如每天 1 点执行）

```bash
# 分 时 日 月 周 scheduledCleanup.sh所在目录
0 1 * * * ~/LinuxTrash/scheduledCleanup.sh
0 23 1 * * /bin/rm  ~/.trash/scheduledCleanup.log  # 每月定时清空删除日志
```

保存并退出即可。

## 垃圾桶结构

您“删除”的文件将会被重命名加上当前时间，并移动 (`mv`) 至 `~/.trash` 目录内。这个如果您“删除”的是目录，则目录的内容不会被重命名，垃圾桶的结构看起来像下面的样子：
```bash
$ tree .trash/

.trash/
├── test_dir_1-2024-06-18_09-10-12
│   └── test_file.txt
├── test_file_1.txt-2024-06-18_09-10-12
└── test_file_2.txt-2024-06-18_09-10-12

1 directory, 3 files
```

## 注意事项⚠️

使用了 `trash.sh` 并不代表数据或文件可以高枕无忧的被“删除”，您仍然需要备份重要的数据，确保万无一失。

## 许可证

这个项目采用 MIT 许可证 - 详情见 [LICENSE](./LICENSE) 文件。

### 欢迎赞助 —— 哪怕只是一杯咖啡也非常有帮助！
### Donations are welcome — even a cup of coffee helps!

<p align="center">
  <img src="https://github.com/user-attachments/assets/da09772b-146b-4d27-828f-012225527d33" width="200" style="margin-right:10px;" />
  <img src="https://github.com/user-attachments/assets/c2dddd0d-fe0f-40ad-8672-6b51cf77696a" width="150" />
</p>


