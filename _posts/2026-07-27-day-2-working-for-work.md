---
title: 'Day 2: Working for work'
description:
categories: ['RIF']
tags: ['daily', 'unemployment', 'recruiters']
toc: true
---

# Day 2

Today was worthwhile. Here are the stats for the day:

- Recruiter interactions: 5
- Scheduled calls: 6 (1 pending)
- Applications submitted: 3
- Network interactions: 7 (SMS, LinkedIn, and email)—several scheduled appointments

I also continued updating my personal projects so that I can share them on this site using Codex (GPT-5.6 Sol). I spent most of my time networking today, though, and it was definitely draining. I'm an introvert by default, but I can be extroverted at 100% energy.

This morning was tough—my wife had doubts about the strategies that I've taken for navigating the job market and unemployment. She wanted to see more job applications submitted, but I only had 2 to show her. It was a gut check. Am I sure I'm doing this the right way? I sure friggin' think so. I realized as I was finding interesting jobs that just blanket-submitting an average résumé to increase a stat count felt _exactly_ wrong. Several had the option to submit a cover letter, and I know that is a wonderful way to break the monotony of résumé reviews. So I paced myself and focused the second half of my day on tailoring a résumé and writing a cover letter for a couple of positions that I'm hopeful for.

In addition to that, the networking that I did at the beginning of my day bore fruit in the latter half of the day. I got a couple of quality recruiter calls with high-match open roles, then scheduled two other recruiter calls for Tuesday, 07/28, and Wednesday, 07/29. My wife is more confident now—and apologetic. She is awesome.

I've been working a lot in the ChatGPT ecosystem with Codex for coding tasks. I have the Plus plan, which has been good enough for my previous personal-project pace (slow, very slow pace). Now that I'm working on projects full-time, I may need to increase it. It's unlikely that I'll do this, though. My OpenClaw instance is nagging me to rejoin its awesomeness. Literal nagging, actually—I ran out of Claude API credits a month or so ago and still have a scheduled job that fails. It pings me in Matrix (my IAE—integrated-agent environment) weekly, letting me know it misses me, a.k.a., it failed and needs $$$. I still see that as the way forward for homelabbing and being serious about agentic development.

Also, hmu on Matrix: `@trevor:matrix.broaddus.app`. If that doesn't work, drop me a line at `fizzes.basal-7z@icloud.com` and I'll fix some tidbits on my server.

## OpenClaw Architecture Spitballing

My main home-lab server is a Beelink SER8 mini PC with the AMD Ryzen 7, 32 GB of DDR5 memory, and a 1 TB NVMe SSD. I have it running Omarchy, which has been an interesting experiment. Overall, it's comfortable, though it needs some love and attention to make it a true daily driver that I would love. I can run a few local models in the Qwen family, which is what I'll be doing. The planned architecture looks like this:

Beelink ->
    --> Qwen 3.5 9B as a slower fallback
    --> OpenClaw instance with Claude and Grok API access for high-level orchestration and difficult workflow orchestration
    --> Matrix integration with a self-hosted homeserver
MacBook M4 Pro ->
    --> Qwen Coder 14B for well-thought-out coding tasks
    --> Possibly some Codex usage as credits/plan allow

<insert really cool model stats for the respective hardware here jkjk don't have them>

There is some other tuning to do for the MacBook since it is my daily driver, and I don't want model usage to bog down my day-to-day use. Available memory is the true bottleneck. Downloading and running the models alone takes up a significant chunk of memory, and then you have context window allocations. Those can be trimmed, but to a certain extent, you're also trimming their usefulness.

For the Beelink, with no dedicated graphics card, its processing power is limited. I have some experimentation to do with the available parameters on the LLM, plus 32 GB of memory gives me a little more headroom than the MacBook. There is much to learn in this ecosystem, and I am sprinting towards experimentation time!

Once I have this all configured and deployed, I have a lot of experimentation to do.
I am simultaneously praying to land a job AND have enough time to fully configure and exercise this setup.

The rest is up to God!
