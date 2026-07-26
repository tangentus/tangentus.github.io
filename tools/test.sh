#!/usr/bin/env bash

set -eu

SITE_DIR="_site"

if [[ -d $SITE_DIR ]]; then
  rm -rf "$SITE_DIR"
fi

JEKYLL_ENV=production bundle exec jekyll build -d "$SITE_DIR"

env -u DEBUG bundle exec htmlproofer "$SITE_DIR" \
  --disable-external \
  --ignore-urls "/^http:\/\/127.0.0.1/,/^http:\/\/0.0.0.0/,/^http:\/\/localhost/"
