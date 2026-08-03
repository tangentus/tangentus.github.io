#!/usr/bin/env ruby

# Chirpy resolves tab titles through its locale data. Add labels for custom
# tabs without copying and freezing the theme's entire locale file.
Jekyll::Hooks.register :site, :post_read do |site|
  locale = site.config.fetch("lang", "en")
  tabs = site.data.dig("locales", locale, "tabs")
  tabs["ai-posts"] = "AI Posts" if tabs
  tabs["projects"] = "Projects" if tabs
end
