#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search Kiwix
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📚
# @raycast.packageName Search
# @raycast.argument1 { "type": "text", "placeholder": "query (or wiki:, so:, dev:)" }

# Documentation:
# @raycast.description Search offline Wikipedia, Stack Overflow, DevDocs, and 72 more ZIMs on the NAS

BASE="https://wikipedia.sasha.computer"
INPUT="$1"

# URL-encode a string
urlencode() {
  python3 -c "import urllib.parse; print(urllib.parse.quote('$1'))"
}

# Build search URL for a specific book
search_book() {
  local book="$1"
  local query="$2"
  local encoded
  encoded=$(urlencode "$query")
  open "${BASE}/search?books.name=${book}&pattern=${encoded}"
}

# Build search URL for all English books (Wikipedia default)
search_default() {
  local query="$1"
  local encoded
  encoded=$(urlencode "$query")
  open "${BASE}/search?books.name=wikipedia_en_all_maxi&pattern=${encoded}"
}

# Prefixes for quick access to specific books
case "$INPUT" in
  wiki:*)
    search_book "wikipedia_en_all_maxi" "${INPUT#wiki:}"
    ;;
  so:*)
    search_book "stackoverflow.com_en_all" "${INPUT#so:}"
    ;;
  dev:*)
    REST="${INPUT#dev:}"
    case "$REST" in
      ts:*|typescript:*) search_book "devdocs_en_typescript" "${REST#*:}" ;;
      js:*|javascript:*) search_book "devdocs_en_javascript" "${REST#*:}" ;;
      py:*|python:*)     search_book "devdocs_en_python"     "${REST#*:}" ;;
      go:*)              search_book "devdocs_en_go"          "${REST#*:}" ;;
      rust:*)            search_book "devdocs_en_rust"        "${REST#*:}" ;;
      node:*)            search_book "devdocs_en_node"        "${REST#*:}" ;;
      docker:*)          search_book "devdocs_en_docker"      "${REST#*:}" ;;
      pg:*|postgres:*)   search_book "devdocs_en_postgresql"  "${REST#*:}" ;;
      react:*)           search_book "devdocs_en_react"       "${REST#*:}" ;;
      css:*)             search_book "devdocs_en_css"         "${REST#*:}" ;;
      git:*)             search_book "devdocs_en_git"         "${REST#*:}" ;;
      redis:*)           search_book "devdocs_en_redis"       "${REST#*:}" ;;
      k8s:*|kubernetes:*) search_book "devdocs_en_kubernetes" "${REST#*:}" ;;
      sqlite:*)          search_book "devdocs_en_sqlite"      "${REST#*:}" ;;
      html:*)            search_book "devdocs_en_html"        "${REST#*:}" ;;
      bash:*)            search_book "devdocs_en_bash"        "${REST#*:}" ;;
      fish:*)            search_book "devdocs_en_fish"        "${REST#*:}" ;;
      *)                 search_default "$REST" ;;
    esac
    ;;
  math:*)
    search_book "math.stackexchange.com_en_all" "${INPUT#math:}"
    ;;
  sec:*)
    search_book "security.stackexchange.com_en_all" "${INPUT#sec:}"
    ;;
  unix:*)
    search_book "unix.stackexchange.com_en_all" "${INPUT#unix:}"
    ;;
  su:*)
    search_book "superuser.com_en_all" "${INPUT#su:}"
    ;;
  sf:*)
    search_book "serverfault.com_en_all" "${INPUT#sf:}"
    ;;
  dba:*)
    search_book "dba.stackexchange.com_en_all" "${INPUT#dba:}"
    ;;
  xkcd:*)
    search_book "xkcd.com_en_all" "${INPUT#xkcd:}"
    ;;
  btc:*)
    search_book "bitcoin.stackexchange.com_en_all" "${INPUT#btc:}"
    ;;
  xmr:*)
    search_book "monero.stackexchange.com_en_all" "${INPUT#xmr:}"
    ;;
  *)
    # Default: search Wikipedia
    search_default "$INPUT"
    ;;
esac
