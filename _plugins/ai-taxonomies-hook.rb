#!/usr/bin/env ruby

# Jekyll builds site.categories and site.tags from _posts only. Merge the AI
# collection into those indexes so jekyll-archives generates taxonomy pages
# for AI posts without adding them to the main post collection.
Jekyll::Hooks.register :site, :post_read do |site|
  ai_posts = site.collections["ai_posts"]&.docs
  next unless ai_posts

  {
    "categories" => site.categories,
    "tags" => site.tags
  }.each do |attribute, taxonomy|
    ai_posts.each do |post|
      Array(post.data[attribute]).each do |name|
        taxonomy[name] << post unless taxonomy[name].include?(post)
      end
    end

    taxonomy.each_value do |posts|
      posts.sort!.reverse!
    end
  end
end
