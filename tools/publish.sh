#!/usr/bin/env bash

set -eu

usage() {
  cat <<'EOF'
Publish a Jekyll draft by moving it from _drafts/ to _posts/.

Usage:
  bash tools/publish.sh DRAFT

DRAFT may be a filename or a path directly inside _drafts/. Shell-expanded
paths such as _drafts/*.md are accepted when they resolve to one draft.
Published post filenames must use Jekyll's YYYY-MM-DD-slug.md format.

Examples:
  bash tools/publish.sh 2026-07-25-day-0-rif-aftermath.md
  bash tools/publish.sh _drafts/2026-07-25-day-0-rif-aftermath.md
EOF
}

fail() {
  printf 'Error: %s\n\n' "$1" >&2
  usage >&2
  exit 2
}

if [[ ${1:-} == "-h" || ${1:-} == "--help" ]]; then
  usage
  exit 0
fi

[[ $# -eq 1 ]] || fail "exactly one draft is required"

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
draft_dir="$repo_root/_drafts"
post_dir="$repo_root/_posts"
draft_arg="${1%/}"

case "$draft_arg" in
  "$draft_dir"/*)
    draft_name="${draft_arg#"$draft_dir/"}"
    ;;
  _drafts/*)
    draft_name="${draft_arg#_drafts/}"
    ;;
  ./_drafts/*)
    draft_name="${draft_arg#./_drafts/}"
    ;;
  *)
    draft_name="$draft_arg"
    ;;
esac

[[ -n "$draft_name" && "$draft_name" != */* ]] ||
  fail "the draft must be directly inside _drafts"

[[ "$draft_name" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}-.+\.md$ ]] ||
  fail "the filename must use the YYYY-MM-DD-slug.md format"

draft_path="$draft_dir/$draft_name"
post_path="$post_dir/$draft_name"

[[ -f "$draft_path" ]] || fail "draft does not exist: $draft_path"
[[ ! -e "$post_path" ]] || fail "post already exists: $post_path"

mkdir -p "$post_dir"
mv -- "$draft_path" "$post_path"

printf 'Published %s\n' "$post_path"
