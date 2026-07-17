#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# update.sh — build thử, commit và push mọi thay đổi lên GitHub.
# Website https://thvphuong.id.vn sẽ tự cập nhật sau ~1 phút.
#
# Cách dùng:
#   ./update.sh                        # commit với message mặc định
#   ./update.sh "Add NeurIPS paper"    # commit với message tùy chọn
# ---------------------------------------------------------------------------
set -euo pipefail
cd "$(dirname "$0")"

# Không có gì thay đổi thì thôi
if git diff --quiet && git diff --cached --quiet && [ -z "$(git status --porcelain)" ]; then
  echo "✔ Không có thay đổi nào để push."
  exit 0
fi

echo "▸ Build thử để bắt lỗi (JSON sai cú pháp, thiếu ảnh...)"
npm run build

echo "▸ Commit & push"
git add -A
git commit -m "${1:-Update content ($(date '+%Y-%m-%d %H:%M'))}"
git -c credential.helper= -c 'credential.helper=!gh auth git-credential' push

echo ""
echo "✔ Đã push. GitHub Actions đang build — site sẽ cập nhật sau ~1 phút:"
echo "  https://thvphuong.id.vn"
echo "  Theo dõi tiến trình: https://github.com/BongoJuniorrr/BongoJuniorrr.github.io/actions"
