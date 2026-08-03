#!/usr/bin/env bash

set -eu

usage() {
  cat <<'EOF'
Unpublish a Jekyll post by moving it from _posts/ back to _drafts/.

Usage:
  bash tools/unpublish.sh POST

POST may be a filename or a path directly inside _posts/. Shell-expanded
paths such as _posts/*.md are accepted when they resolve to one post.
Post filenames must use Jekyll's YYYY-MM-DD-slug.md format.

Examples:
  bash tools/unpublish.sh 2026-07-25-day-0-rif-aftermath.md
  bash tools/unpublish.sh _posts/2026-07-25-day-0-rif-aftermath.md
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

[[ $# -eq 1 ]] || fail "exactly one post is required"

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
post_dir="$repo_root/_posts"
draft_dir="$repo_root/_drafts"
post_arg="${1%/}"

case "$post_arg" in
  "$post_dir"/*)
    post_name="${post_arg#"$post_dir/"}"
    ;;
  _posts/*)
    post_name="${post_arg#_posts/}"
    ;;
  ./_posts/*)
    post_name="${post_arg#./_posts/}"
    ;;
  *)
    post_name="$post_arg"
    ;;
esac

[[ -n "$post_name" && "$post_name" != */* ]] ||
  fail "the post must be directly inside _posts"

[[ "$post_name" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}-.+\.md$ ]] ||
  fail "the filename must use the YYYY-MM-DD-slug.md format"

post_path="$post_dir/$post_name"
draft_path="$draft_dir/$post_name"

[[ -f "$post_path" ]] || fail "post does not exist: $post_path"
[[ ! -e "$draft_path" ]] || fail "draft already exists: $draft_path"

mkdir -p "$draft_dir"
mv -- "$post_path" "$draft_path"

printf 'Unpublished %s\n' "$draft_path"
printf 'Preview drafts with: bash tools/run.sh --drafts\n'
