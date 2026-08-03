# tangentus.github.io

Trevor Broaddus's personal site and blog, built with
[Jekyll](https://jekyllrb.com/) and the
[Chirpy theme](https://github.com/cotes2020/jekyll-theme-chirpy).

## Local development

Use Ruby 3.4, then install and serve the site:

```console
bundle install
bundle exec jekyll serve --livereload
```

Open <http://127.0.0.1:4000>.

## Create a draft

Create a Chirpy-ready draft by passing the title first:

```console
bash tools/new-draft.sh "Composable APIs" \
  --category Engineering \
  --tags "ruby, architecture"
```

Categories and tags can be comma-separated or supplied with repeated flags.
Drafts are written to `_drafts/` and can be previewed locally with:

```console
bash tools/run.sh --drafts
```

## Publish a draft

Move a publication-ready draft from `_drafts/` to `_posts/`:

```console
bash tools/publish.sh 2026-07-25-day-0-rif-aftermath.md
bash tools/publish.sh _drafts/2026-07-25-day-0-rif-aftermath.md
```

Shell-expanded paths such as `_drafts/*.md` also work when they resolve to one
draft. Published filenames must use Jekyll's `YYYY-MM-DD-slug.md` format. The
command refuses to overwrite an existing post.

## Publish an AI-generated post

AI-generated posts belong in `_ai_posts/`, not `_posts/`. This keeps them out
of the main homepage, archives, and post feed while publishing them under the
dedicated `/ai-posts/` tab.

Use a `YYYY-MM-DD-slug.md` filename and include an explicit `date` in the front
matter because custom Jekyll collections do not infer dates the way `_posts`
does:

```yaml
---
title: "(AI Generated) Example title"
date: 2026-08-02 08:00:00 -0400
description: A short summary for the AI Posts tab.
categories: ['RIF-AI']
tags: ['ai-written']
toc: true
---
```

The AI automation should create its files in `_ai_posts/` using this front
matter. The existing disclosure should remain in the body of every AI post.

## Unpublish a post

Move a published post from `_posts/` back to `_drafts/`:

```console
bash tools/unpublish.sh 2026-07-25-day-0-rif-aftermath.md
bash tools/unpublish.sh _posts/2026-07-25-day-0-rif-aftermath.md
```

Shell-expanded paths such as `_posts/*.md` also work when they resolve to one
post. The command refuses to overwrite an existing draft.

## Validation

Build the production site and check its generated HTML:

```console
bash tools/test.sh
```

Deployment is handled by the GitHub Pages workflow in
`.github/workflows/pages-deploy.yml`.
