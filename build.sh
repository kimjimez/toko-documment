#!/bin/bash
# Build TOKO Manuals เป็นทั้ง PDF และ Word
# Usage: ./build.sh [pdf|docx|all] [shop|ops|both]

set -e
cd "$(dirname "$0")"

TARGET="${1:-all}"
DOC="${2:-both}"

FILTER=""
if command -v mermaid-filter >/dev/null 2>&1; then
  FILTER="-F mermaid-filter"
fi

build_pdf() {
  local src="$1"; local out="$2"
  echo ">> Building PDF: $out"
  pandoc "$src" -o "$out" \
    --pdf-engine=xelatex \
    --toc --toc-depth=2 \
    -V colorlinks=true \
    $FILTER
  echo "   -> $out"
}

build_docx() {
  local src="$1"; local out="$2"
  echo ">> Building DOCX: $out"
  pandoc "$src" -o "$out" \
    --reference-doc=reference.docx \
    --toc --toc-depth=2 \
    $FILTER
  echo "   -> $out"
}

build_doc() {
  local src="$1"; local base="$2"
  case "$TARGET" in
    pdf)  build_pdf  "$src" "${base}.pdf" ;;
    docx) build_docx "$src" "${base}.docx" ;;
    all)  build_pdf  "$src" "${base}.pdf"; build_docx "$src" "${base}.docx" ;;
    *)    echo "Usage: $0 [pdf|docx|all] [shop|ops|both]"; exit 1 ;;
  esac
}

case "$DOC" in
  shop)   build_doc "TOKO_Shop_Manual.md"           "TOKO_Shop_Manual" ;;
  ops)    build_doc "TOKO_Operation_Manual.md"      "TOKO_Operation_Manual" ;;
  both|all-docs)
        build_doc "TOKO_Shop_Manual.md"          "TOKO_Shop_Manual"
        build_doc "TOKO_Operation_Manual.md"     "TOKO_Operation_Manual" ;;
  *)    echo "Usage: $0 [pdf|docx|all] [shop|ops|both]"; exit 1 ;;
esac

echo "Done."
ls -lh TOKO_*.{pdf,docx} 2>/dev/null
