+++
title = "Let's vibe-code a Sphinx extension"
date = "2026-08-26T10:31:06-07:00"
author = "JJ Coldiron"
showFullContent = false
readingTime = false
hideComments = false
+++

***(Originally published to [discourse.ubuntu.com](https://discourse.ubuntu.com/t/lets-vibe-code-a-sphinx-extension/86743))***

Through my work on the documentation team at Canonical, I seem to have garnered a
reputation as our resident Sphinx nerd, and I wear this title proudly. The best part of
this has been my colleagues coming to me with interesting problems and ideas on how our
docs tooling can be improved.

But I now have a problem that I’m sure many of you share: I have more ideas for side
projects than I could ever finish on my own.

So, I decided to see what all this agentic development fuss was about. I admit that I
wasn’t very hopeful, as I’d tried raw prompting in some of my Sphinx extensions and was
always disappointed with the output. Despite this, I cobbled together an agent with some
basic skills and put it to work. This started as an exercise in LLM adoption, but as I
refined the agent, I found myself using it for a nontrivial chunk of my day-to-day work.

To show what this looks like, I’ll take you along as I use my [Sphinx development
agent](https://github.com/jahn-junior/sphinx-dev-agent) to solve a documentation problem
that was posed to me earlier this week.

## Identifying a problem

A tool is only useful if it solves a real problem, and identifying these juicy problems
isn't something the bots are particularly good at. Luckily for me, documentation is full
of such problems.

Just this week, my colleague Graham asked me what the best way to transclude content
from remote sources was. Now this is something I have very strong opinions about, and
poor Graham probably wasn’t prepared for the can of worms he opened.

For the uninitiated, what Graham wanted to do was automatically pull Markdown or
reStructuredText from another project and splice it into a page he was writing. There
are a handful of ways to do this, such as with Git submodules or clever Python tricks,
but I’ve never liked the ergonomics of these solutions. Graham and I decided that what
we really wanted was a nice syntax for doing this directly in a Sphinx document.

## Designing the solution

With a problem identified, it was time to start thinking about how the extension should
look and feel. So, I opened up a new Copilot Chat session, put it in planning mode, and
started describing the high-level design. When designing any extension, I’m asking
myself questions like:

* How is the extension invoked?  
* Is the syntax consistent with first-party Sphinx tools?  
* How much configuration is exposed to the user?  
* Does the extension introduce new failure points to the build?

Over my past few planning sessions, I had an agent write and edit a
`/plan-sphinx-extension` skill. With this skill, I now design extensions interactively
and have the agent modify the plan with each change to the design. This phase is just as
much about figuring out how I want the extension to feel as it is about relaying that to
the agent. Unless the implementation is particularly complex, this is where I spend most
of my time.

To solve the source transclusion problem, I knew I wanted a directive that pulls sources
from Github and feels like the `include` directive that Sphinx ships with. After sharing
this with the agent, it asked what the argument syntax should look like, what additional
options were needed, and what features to focus on for the initial proof of concept. I
ultimately decided on the following syntax:

```
.. github-include:: owner/repo:path/to/doc
```

The agent even asked me how it should handle versioning, which wasn’t something I
included in my initial design plan. After accepting its suggestion to add `branch`,
`tag`, and `commit` options, I reviewed the full implementation plan and let the agent
get to work.

## Cutting the agent loose

The Sphinx development agent was designed to implement extensions in phases. After each
phase, it writes and builds a set of test documentation, resolves any errors, and lints
the Python code before asking for a review. This workflow is described in the
`/lint-python` and `/verify-build` skills. To speed up these iterations, I typically let
the agent run on autopilot between reviews.

This isn’t something to just sit back and watch. It requires active participation and
careful review. After each phase of the `github-include` implementation, I had to
manually test the extension and steer the agent to fix bugs, account for edge cases, or
adjust its implementation approach. But after about an hour of iteration, a good chunk
of which I spent writing this blog post, I had an extension prototype that would’ve
taken me the better part of a workday to write myself.

## Wrapping things up

Once I was happy with the extension and its output, I dropped the generated code into
our standard [Sphinx extension
template](https://github.com/canonical/sphinx-ext-template) so I could run my usual
Python linters, type checkers, and formatters. I don’t start with the template because
I’ve found it wreaks havoc on the agent’s context window. Starting in an empty directory
has given me much more focused sessions and cleaner output.

Every time I’ve gone through this workflow, I’ve been left with some wrinkles to massage
out, and this extension was no exception. There were a handful of lint errors and
incorrect type hints that made it past the `/lint-python` skill, but a few minutes of
more focused prompting took care of these.

I also had the agent fill in the test scaffolding from the template. There aren't any
testing skills yet, as I normally write tests myself to make sure I have a good
understanding of the codebase. The template provided enough of a starting point for the
`github-include` tests, but over my next few development sessions, I plan to build up a
new skill to make the output more consistent.

If you’re curious to see the results of this session, you can view the
`sphinx-github-include` extension on
[GitHub](https://github.com/jahn-junior/sphinx-github-include) or install it from
[PyPI](https://pypi.org/project/sphinx-github-include/).

## Try it out for yourself

Next time you have an idea for a Sphinx extension, try implementing it with an agent!
You’ll probably be surprised by the results. Before you start, however, I encourage you
to ask yourself the following questions:

* ***Is a Sphinx extension the right solution for my problem?*** Extensions should add
  new syntax and behavior to Sphinx. They generally shouldn’t be used to wrap files or
  configure your project, which introduces abstraction without simplification.  
* ***Has someone already solved my problem?*** Look through the Sphinx documentation or
  ask an LLM if Sphinx already ships a solution for your problem. We don’t want to spend
  tokens and boil oceans just to reinvent the wheel.  
* ***Should I be using an agent in the first place?*** If you’re primarily concerned
  with the outcome, want to save yourself some development time, or want to experiment
  with agentic development, then the answer is probably yes. If you want to build
  foundational Sphinx development skills, this probably isn’t the best way to start.
  Instead, I highly recommend working through the [Extending Sphinx
  tutorials](https://www.sphinx-doc.org/en/master/development/tutorials/index.html) from
  the official documentation.  
* ***Am I comfortable assessing Python code quality?*** This workflow is made to save
  time, not to replace technical expertise. If you aren’t comfortable, ask a friend or
  colleague who is\! Of course, this only applies for code you want to push to
  production. For prototypes and pet projects, just embrace the vibes.  
* ***Who’s going to maintain my extension?*** If your extension is going to end up in
  production docs, it should have a maintainer. The time this will take is proportional
  to the extension’s complexity. Again, if it’s a prototype or pet project, this
  probably isn’t a concern.

Assuming this is the right approach for your case, start by dropping [the agent and its
files](https://github.com/jahn-junior/sphinx-dev-agent) into a new project directory.
Your model choice will depend on the complexity of your extension, but I’ve found that
Claude Sonnet 4.5 works well in most cases.

If you notice any weird behavior in the skills as you work, have your agent revise the
skills and propose the changes upstream! These skills were written entirely by agents as
I worked on our Sphinx tooling. They're far from perfect, but they get a little better
every session.
