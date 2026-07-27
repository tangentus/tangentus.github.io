#!/usr/bin/env bash

set -eu

usage() {
  cat <<'EOF'
Create a new Chirpy draft.

Usage:
  bash tools/new-draft.sh "Post Title" [options]

Options:
  --category VALUE  Add a category. Repeat the flag or use commas for several.
  --tags VALUE      Add tags. Repeat the flag or use commas for several.
  -h, --help        Show this help.

Examples:
  bash tools/new-draft.sh "Question the Defaults"
  bash tools/new-draft.sh "Composable APIs" \
    --category Engineering \
    --tags "ruby, architecture"
EOF
}

fail() {
  printf 'Error: %s\n\n' "$1" >&2
  usage >&2
  exit 2
}

trim() {
  printf '%s' "$1" | sed \
    -e 's/^[[:space:]]*//' \
    -e 's/[[:space:]]*$//'
}

append_unique() {
  local value="$1"
  local array_name="$2"
  local existing
  local -n values="$array_name"

  [[ -n "$value" ]] || return 0

  for existing in "${values[@]}"; do
    [[ "$existing" != "$value" ]] || return 0
  done

  values+=("$value")
}

append_list() {
  local raw_value="$1"
  local array_name="$2"
  local part
  local -a parts

  IFS=',' read -r -a parts <<< "$raw_value"

  for part in "${parts[@]}"; do
    append_unique "$(trim "$part")" "$array_name"
  done
}

yaml_quote() {
  local escaped
  escaped="$(printf '%s' "$1" | sed "s/'/''/g")"
  printf "'%s'" "$escaped"
}

yaml_list() {
  local array_name="$1"
  local item
  local separator=""
  local -n values="$array_name"

  printf '['
  for item in "${values[@]}"; do
    printf '%s' "$separator"
    yaml_quote "$item"
    separator=', '
  done
  printf ']'
}

if [[ ${1:-} == "-h" || ${1:-} == "--help" ]]; then
  usage
  exit 0
fi

[[ $# -gt 0 ]] || fail "a post title is required"

title="$1"
shift

[[ -n "$(trim "$title")" ]] || fail "the post title cannot be empty"

categories=()
tags=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --category)
      [[ $# -ge 2 ]] || fail "--category requires a value"
      append_list "$2" categories
      shift 2
      ;;
    --tags)
      [[ $# -ge 2 ]] || fail "--tags requires a value"
      append_list "$2" tags
      shift 2
      ;;
    -h | --help)
      usage
      exit 0
      ;;
    *)
      fail "unknown argument: $1"
      ;;
  esac
done

slug="$(
  printf '%s' "$title" |
    iconv -c -t ASCII//TRANSLIT |
    tr '[:upper:]' '[:lower:]' |
    sed \
      -e 's/[^a-z0-9][^a-z0-9]*/-/g' \
      -e 's/^-//' \
      -e 's/-$//'
)"

[[ -n "$slug" ]] || fail "the title did not produce a usable filename"

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
draft_dir="$repo_root/_drafts"
draft_date="$(date '+%Y-%m-%d')"
draft_path="$draft_dir/$draft_date-$slug.md"

[[ ! -e "$draft_path" ]] || fail "draft already exists: $draft_path"

mkdir -p "$draft_dir"

{
  printf '%s\n' '---'
  printf 'title: %s\n' "$(yaml_quote "$title")"
  printf 'description:\n'
  printf 'categories: %s\n' "$(yaml_list categories)"
  printf 'tags: %s\n' "$(yaml_list tags)"
  printf 'toc: true\n'
  printf '%s\n\n' '---'
  printf '<!-- Write your post here. -->\n'
} > "$draft_path"

printf 'Created %s\n' "$draft_path"
printf 'Preview drafts with: bash tools/run.sh --drafts\n'
