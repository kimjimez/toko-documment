#!/bin/bash
# Build TOKO Manuals เป็น PDF
# Usage: ./build.sh [shop|ops|notif|both]

set -e
cd "$(dirname "$0")"

DOC="${1:-both}"

FILTER=""
if command -v mermaid-filter >/dev/null 2>&1; then
  FILTER="-F mermaid-filter"
fi

build_pdf() {
  local src="$1"; local out="$2"
  echo ">> Building PDF: $out"
  pandoc "$src" -o "$out" \
    --pdf-engine=xelatex \
    -H header.tex \
    --toc --toc-depth=2 \
    -V colorlinks=true \
    $FILTER
  echo "   -> $out"
}

build_doc() {
  local src="$1"; local base="$2"
  build_pdf "$src" "${base}.pdf"
}

case "$DOC" in
  shop)   build_doc "TOKO_Shop_Manual.md"           "TOKO_Shop_Manual" ;;
  ops)    build_doc "TOKO_Operation_Manual.md"      "TOKO_Operation_Manual" ;;
  notif)  build_doc "TOKO_Notification_Resend_Operation.md" "TOKO_Notification_Resend_Operation" ;;
  both|all-docs)
        build_doc "TOKO_Shop_Manual.md"          "TOKO_Shop_Manual"
        build_doc "TOKO_Operation_Manual.md"     "TOKO_Operation_Manual" ;;
  *)    echo "Usage: $0 [shop|ops|notif|both]"; exit 1 ;;
esac

echo "Done."
ls -lh TOKO_*.pdf 2>/dev/null
