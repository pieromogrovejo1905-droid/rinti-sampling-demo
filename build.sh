#!/bin/sh
# Genera docs/ (sitio GitHub Pages) desde index.html (fuente del artifact)
set -e
cd "$(dirname "$0")"
rm -rf docs && mkdir -p docs/img
cp img/*.png docs/img/
{
  printf '<!doctype html>\n<html lang="es">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n<meta name="robots" content="noindex">\n<meta name="theme-color" content="#3b47e0">\n<link rel="icon" href="img/rinti-r.png">\n</head>\n<body>\n'
  grep -v '^<meta charset="utf-8">$' index.html
  printf '\n</body>\n</html>\n'
} > docs/index.html
echo "sampling-rinti.holafree.com" > docs/CNAME
