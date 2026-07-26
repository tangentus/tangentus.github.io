#!/usr/bin/env bash

set -eu

bundle exec jekyll serve --livereload --host 127.0.0.1 "$@"
