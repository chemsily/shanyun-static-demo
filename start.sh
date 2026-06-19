#!/usr/bin/env bash
# ============================================================
# 衫云智管 - 一键启动脚本（静态演示版）
# 无需 Node.js，用浏览器直接打开 HTML 即可
# ============================================================
cd "$(dirname "$0")"

# 选择可用的静态服务器
if command -v python3 >/dev/null 2>&1; then
  echo "==> 使用 Python 启动静态服务器"
  echo "    打开 http://localhost:8765"
  echo "    账号：demo / demo123"
  echo "    按 Ctrl+C 停止"
  echo
  exec python3 -m http.server 8765
elif command -v npx >/dev/null 2>&1; then
  echo "==> 使用 npx serve 启动"
  echo "    打开 http://localhost:8765"
  echo
  exec npx -y serve -l 8765 .
elif command -v php >/dev/null 2>&1; then
  echo "==> 使用 PHP 启动"
  echo "    打开 http://localhost:8765"
  echo
  exec php -S 0.0.0.0:8765
else
  echo "未找到可用的静态服务器（python3 / npx / php）"
  echo "请直接双击 index.html 打开（推荐用 Chrome / Edge）"
  exit 1
fi
