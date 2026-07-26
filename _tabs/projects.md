---
title: Projects
icon: fas fa-code-branch
order: 1
description: Software projects and experiments from Trev and Tangential Solutions.
---

Software is most interesting when it turns a vague idea into something useful.
Here is one of the projects that has shaped how I think about flexible systems.

<article class="project-card">
  <div class="project-card__header">
    <div>
      <p class="project-card__eyebrow">Tangential Solutions</p>
      <h2>WebScrape API</h2>
    </div>
    <a class="project-card__link" href="https://github.com/TangentialSolutions/web-scrape-api" target="_blank" rel="noopener noreferrer">
      View on GitHub <span aria-hidden="true">↗</span>
    </a>
  </div>

  <p>
    An API for triggering customizable web scrapes, with an architecture
    designed to accommodate the changing shape of data on the web.
  </p>

  <ul class="project-card__tags" aria-label="Technologies">
    <li>Ruby</li>
    <li>MongoDB</li>
    <li>Resque</li>
    <li>Web scraping</li>
  </ul>

  <h3>What makes it interesting</h3>

  <ul>
    <li>
      MongoDB provides a flexible home for scrape results whose schema changes
      from one source to the next.
    </li>
    <li>
      Scraping strategies are composable, making it straightforward to add
      specialized behavior for links, images, and other resources.
    </li>
    <li>
      Ruby's <code>&gt;&gt;</code> operator composes <code>Proc</code> objects,
      passing the result of one operation into the next.
    </li>
    <li>
      Background work runs through Resque so larger scrapes do not hold up API
      requests.
    </li>
  </ul>
</article>

More experiments live in the
[Tangential Solutions organization](https://github.com/TangentialSolutions){:target="_blank" rel="noopener noreferrer"}.
