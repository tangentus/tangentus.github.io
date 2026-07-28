---
title: Projects
icon: fas fa-code-branch
order: 1
description: Software projects and experiments from Trev and Tangential Solutions.
---

Software is most interesting when it turns a vague idea into something useful.
Here are a few projects that have shaped how I think about useful, flexible
systems.

<article class="project-card">
  <div class="project-card__header">
    <div>
      <p class="project-card__eyebrow">Tangential Solutions</p>
      <h2>Family Sessions</h2>
    </div>
    <a class="project-card__link" href="https://famsesh.broaddus.app" target="_blank" rel="noopener noreferrer">
      Visit Family Sessions <span aria-hidden="true">↗</span>
    </a>
  </div>

  <p>
    A family activity tracker built for quickly logging how time is spent,
    whether an activity is happening now or was completed earlier.
  </p>

  <ul class="project-card__tags" aria-label="Technologies">
    <li>Ruby on Rails</li>
    <li>Hotwire</li>
    <li>SQLite</li>
    <li>Progressive web app</li>
  </ul>

  <h3>What makes it interesting</h3>

  <ul>
    <li>
      A session can include multiple children, while validation prevents
      overlapping timers for the same child.
    </li>
    <li>
      Quick-start timers and manual entries support both real-time tracking and
      logging activities after the fact.
    </li>
    <li>
      Custom activity categories make the tracker adaptable to each household
      instead of prescribing a single routine.
    </li>
    <li>
      Daily and weekly rollups feed gentle goals for doing at least—or no more
      than—a chosen amount of an activity.
    </li>
  </ul>
</article>

<article class="project-card">
  <div class="project-card__header">
    <div>
      <p class="project-card__eyebrow">Tangential Solutions</p>
      <h2>Budget</h2>
    </div>
    <a class="project-card__link" href="https://dash.broaddus.app/budget" target="_blank" rel="noopener noreferrer">
      Open Budget <span aria-hidden="true">↗</span>
    </a>
  </div>

  <p>
    A personal finance app for planning monthly income and category budgets,
    recording transactions, and seeing at a glance how much remains to spend.
  </p>

  <ul class="project-card__tags" aria-label="Technologies">
    <li>Ruby on Rails</li>
    <li>React</li>
    <li>TypeScript</li>
    <li>PostgreSQL</li>
  </ul>
</article>

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
