#!/bin/bash
# Build TOKO Manual เป็นทั้ง PDF และ Word
# Usage: ./build.sh [pdf|docx|all]

set -e
cd "$(dirname "$0")"

SRC="TOKO_Shop_Manual.md"
TARGET="${1:-all}"

FILTER=""
if command -v mermaid-filter >/dev/null 2>&1; then
  FILTER="-F mermaid-filter"
fi

build_pdf() {
  echo ">> Building PDF..."
  pandoc "$SRC" -o TOKO_Shop_Manual.pdf \
    --pdf-engine=xelatex \
    --toc --toc-depth=2 \
    -V colorlinks=true \
    $FILTER
  echo "   -> TOKO_Shop_Manual.pdf"
}

build_docx() {
  echo ">> Building DOCX..."
  pandoc "$SRC" -o TOKO_Shop_Manual.docx \
    --reference-doc=reference.docx \
    --toc --toc-depth=2 \
    $FILTER
  echo "   -> TOKO_Shop_Manual.docx"
}

case "$TARGET" in
  pdf)  build_pdf ;;
  docx) build_docx ;;
  all)  build_pdf; build_docx ;;
  *)    echo "Usage: $0 [pdf|docx|all]"; exit 1 ;;
esac

echo "Done."
ls -lh TOKO_Shop_Manual.* 2>/dev/null
