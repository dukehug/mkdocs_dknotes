#!/bin/bash

# error handling
set -e

echo "Starting documentation build and deployment...."

# mkdocs build
echo "Building documentation...."
mkdocs build --clean

sleep 5

# github
echo "Pushing to GitHub....."

# 若有未合併的衝突（例如上次 pull/rebase 沒處理完），先暫停，不要繼續往下跑
if git status --porcelain | grep -q '^UU\|^AA\|^DD'; then
    echo "偵測到未解決的合併衝突（conflict），腳本已暫停。"
    echo "請手動解決衝突後再重新執行本腳本。"
    exit 1
fi

# stage 已修改、已刪除、以及新增的檔案
if [ -n "$(git status --porcelain)" ]; then
    git add -A
fi

# 檢查是否有東西需要 commit
if ! git diff-index --quiet HEAD --; then
    git commit -m "update notes: $(date)"

    # push；若因為遠端有新的 commit（non-fast-forward）而失敗，視為衝突，暫停
    if ! git push origin main; then
        echo "Push 失敗，可能是遠端有新的變更造成衝突，腳本已暫停。"
        echo "請執行 'git pull --rebase origin main' 解決後，再重新執行本腳本。"
        exit 1
    fi

    echo "Pushed to GitHub successfully"
else
    echo "No changes to commit"
fi

sleep 5

mkdocs gh-deploy