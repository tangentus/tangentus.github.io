---
title: 'Day 3: First Fruits'
description:
categories: ['RIF']
tags: ['daily', 'unemployment', 'portfolio', 'engineering-culture']
toc: true
---

# Day 3

Here are the stats for the day:

- (new) Recruiter interactions: 2
- (remaining) Scheduled calls: 4
- Interviews planned: 2 (early stages, just the team recruiter conversation)
- (total) Applications submitted: 6
- (new) Network interactions: 2

Such a cool day! I had three wonderful conversations—two with former colleagues and one with a new recruiter whom I'd love to work with. I've also scheduled three more calls: two are initial recruiter interviews, and one is a sync with another recruiter.

In addition, I was able to parallelize some work on my [portfolio website](https://tangentus.github.io/projects/) (which you're currently on, congrats!), which involved cleaning up a couple of personal projects so that they could be publicly shared. I've added a Budgeting app and a Family Session tracker app. Try them out and request access if you need to!

One application I submitted really stood out to me. The team's CTO mentioned that teachability was critical to their hiring process. He said they could teach anyone anything, but changing someone's mentality or personality is much harder. That was so encouraging to hear! I read [*The Ideal Team Player*](https://www.tablegroup.com/product/ideal-team-player/?srsltid=AfmBOoqkQH4eCI71jNCgvNNP478kS1HyCsMPgXOPbjk2KBx2aTRh5krn) by Patrick Lencioni early in my career, and it profoundly changed how I think about being part of a team and how I conduct myself. Humble, hungry, smart. There—Mr. Lencioni just saved you thousands of dollars and countless hours otherwise lost to a bad hire and an even more uncomfortable firing.

**Humble**

This is the teachability that the CTO I mentioned earlier was talking about. Can you learn from someone more junior than you without pride or ego factoring in? How hard are the words "I was wrong, I'm sorry" to say? What would your junior peers say in a review of you?

**Hungry**

It's Friday at 4:30 p.m., and you're finished with all of your tasks for the day. You're a nerd, so you open up your observability platform and peruse the latency and response times of your APIs. Heck, you may as well check on that feature you released and the APIs involved in its operation. Then you see it. An error trace. Wait, what environment is it in? Pfffffftttt, it's production. "Well, I'm not on call; I'm sure they'll see it," right? Maybe. How hungry are you to ensure production errors are properly resolved and safely handed off? Hungry team members have a proven track record of **not** being part of the [bystander effect](https://en.wikipedia.org/wiki/Bystander_effect).

**Smart**

Okay, so you're staying; production errors aren't passive happenings in a sustainable system. But being smart isn't just knowing how to investigate the error. It's knowing how to read the people and the situation around it. Who has the context you need? Who needs to know right now? Can you ask for help without assigning blame or creating panic? A smart teammate checks `git blame` for context, brings in the right people, communicates the impact clearly, and listens to the people who know the system best. If the error is occurring frequently and you can reproduce it, open a P1/P2 incident and give everyone a clear place to coordinate. People smarts turn individual urgency into an effective team response.

Sorry for the tangent, it's just too impactful to not share! Take these qualities to heart and you'll shape your career into whatever you want. Watch people seek you out, watch the humility slice through the arrogance in a split second. Thank you, Patrick Lencioni, for an incredible and insightful read.

Now, on to less culture-sappy things. I have made exactly zero progress on my OpenClaw orchestration setup :/. I should have some time tomorrow to dive into that, especially since I've made headway on the application front and finished the foundation of my [Projects](https://tangentus.github.io/projects/) listings.

I also fixed a few things on my new MacBook after transitioning from Intel to Apple silicon—and from macOS Monterey to Tahoe. The OS upgrade was almost seamless. I had to remove some preexisting LaunchAgents—that's my hypothesis, anyway—after the Time Machine migration before the system would let me log in to my account. I also fixed Homebrew since all of the migrated packages were compiled for Intel chips. That, again, was pretty easy. Just export your Homebrew packages into a Brewfile, nuke the existing Homebrew installation, reinstall, and feed the Brewfile into the new Homebrew binary. A few failures, but for the most part it worked. `rvm` and `nvm` also had to be reinstalled, along with OpenSSL 3, because some Ruby gems are incompatible with the bundled LibreSSL that macOS ships with.

I also did one mile of hill runs this morning after my excellent Bible study on James 2 (partiality).

God is good _all_ the time. God bless!
