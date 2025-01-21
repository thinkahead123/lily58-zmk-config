#!/bin/bash

# 配置
REPO_DIR="./"  # 本地仓库路径
REMOTE="origin"                # 远程仓库名称
BRANCH="trackpoint"                  # 分支名称
TARGET_FILE="lilytp58.keymap"  # 需要修改的文件
STRING_TO_REMOVE="pointing.h"  # 需要删除的包含此字符串的行
echo $REPO_DIR
echo $REMOTE
echo $BRANCH
echo $TARGET_FILE
echo $STRING_TO_REMOVE

# 进入仓库目录
cd "$REPO_DIR" || exit 1

# 无限循环，持续监测远程仓库
while true; do
    # 获取远程仓库的最新状态
    git fetch "$REMOTE"

    # 检查是否有新的提交
    LOCAL_COMMIT=$(git rev-parse "$BRANCH")
    REMOTE_COMMIT=$(git rev-parse "$REMOTE/$BRANCH")

    if [ "$LOCAL_COMMIT" != "$REMOTE_COMMIT" ]; then
        echo "检测到远程仓库有更新，正在同步..."

        # 贮藏本地更改
        git stash

        # 拉取最新代码
        git pull "$REMOTE" "$BRANCH"

        # 恢复贮藏的更改
        git stash pop

        # 修改文件，删除所有包含指定字符串的行
        sed -i '' "/$STRING_TO_REMOVE/d" "$TARGET_FILE"

        # 提交更改
        git add "$TARGET_FILE"
        git commit -m "auto delete '$STRING_TO_REMOVE' lines"

        # 推送到远程仓库
        git push "$REMOTE" "$BRANCH"

        echo "更改已提交并推送到远程仓库。"
    else
        echo "远程仓库无更新。"
    fi

    # 等待一段时间后再次检查
    sleep 20  # 60秒后再次检查
done
