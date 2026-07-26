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

## Validation

Build the production site and check its generated HTML:

```console
bash tools/test.sh
```

Publishing is handled by the GitHub Pages workflow in
`.github/workflows/pages-deploy.yml`.
