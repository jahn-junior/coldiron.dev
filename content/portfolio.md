+++
title = 'Portfolio'
+++

If you'd like to see what I'm working on each day, check out my
[GitHub](https://github.com/jahn-junior).

If not, here are some of the highlights:

## Software

**[reLabel](https://github.com/jahn-junior/sphinx-relabel)**

reLabel is a tool for redirecting labels in Sphinx documentation.

Technical writers go to great lengths to redirect pages and keep links healthy, but we
rarely show the same care with Sphinx labels and references. reLabel was my answer to
that problem.

**[Kitbash](https://github.com/canonical/pydantic-kitbash)**

Kitbash is a tool that generates Sphinx documentation for Pydantic models.

I wrote Kitbash in early 2025 to generate the YAML references for Canonical's craft
tools. To see this in action, check out the [snapcraft.yaml
reference](https://documentation.ubuntu.com/snapcraft/latest/reference/project-file/snapcraft-yaml/#reference-snapcraft-yaml)
and its [reST
source](https://github.com/canonical/snapcraft/blob/main/docs/reference/project-file/snapcraft-yaml.rst?plain=1).

**[sphinx-rerediraffe](https://github.com/jahn-junior/sphinx-rerediraffe)**

Rerediraffe is an actively maintained fork of the first-party
[sphinxext.rediraffe](https://github.com/sphinx-doc/sphinxext-rediraffe) module.

There are many Sphinx extensions for managing redirects, but they all have pros and
cons. My goal in developing the sphinx-rerediraffe fork was to create a complete
redirection solution for Canonical documentation projects. The fork introduces support
for external redirects, cleaner destination URLs, and a more forgiving syntax.

I've proposed the changes upstream to make them available to the wider Sphinx community,
but this extension doesn't look like it's being actively maintained.

**[sphinx-github-include](https://github.com/jahn-junior/sphinx-github-include)**

The sphinx-github-include renders content from GitHub in your Sphinx documentation.

When writing documentation for an ecosystem of products, it's common to reuse content
from other projects. Unfortunately, Sphinx doesn't support this out of the box. This
extension uses the GitHub API to pull and parse remote reStructuredText, Markdown, or
plain text into your Sphinx documentation project.

This extension was developed entirely by agents. If you want to learn more about how
I handle agentic development, give [my blog post](/content/posts/sphinx-vibe-coding.md)
a read.

**[ContrAI](https://github.com/jahn-junior/ContrAI)**

ContrAI is a Lua implementation of Kenneth Stanley's NEAT algorithm that evolves an
agent capable of beating level 1-1 of the game Contra.

This project was developed as the final project for my senior AI elective. I even put
together a [goofy video](https://www.youtube.com/watch?v=tyKUARyRhY4) explaining the
NEAT algorithm and how my script works in practice.

## Documentation

The following pages were authored by me and are publicly available in Canonical product
documentation.

**Product docs**

Some of my notable works from Canonical's 'craft' tools. These pages range from austere
reference material to comprehensive, end-to-end tutorials

- [Imagecraft | Home page](https://ubuntu.com/docs/imagecraft/latest/)
- [Imagecraft | Build an Ubuntu image](https://ubuntu.com/docs/imagecraft/latest/tutorials/build-an-ubuntu-image/)
- [Imagecraft | Configure instances with cloud-init](https://ubuntu.com/docs/imagecraft/latest/how-to/configure-with-cloud-init/)
- [Imagecraft | Pre-install snaps](https://ubuntu.com/docs/imagecraft/latest/how-to/pre-install-snaps/)
- [Imagecraft | Platform grammar](https://ubuntu.com/docs/imagecraft/latest/reference/platform-grammar/)
- [Imagecraft | imagecraft.yaml](https://ubuntu.com/docs/imagecraft/latest/reference/imagecraft-yaml/)
- [Charmcraft | Home page](https://canonical.com/juju/docs/charmcraft/latest/)
- [Charmcraft | Add an icon on Charmhub](https://canonical.com/juju/docs/charmcraft/latest/howto/add-an-icon/)
- [Snapcraft | Authenticate](https://ubuntu.com/docs/snapcraft/latest/how-to/publishing/authenticate/)
- [Snapcraft | Register a snap](https://ubuntu.com/docs/snapcraft/latest/how-to/publishing/register-a-snap/)
- [Snapcraft | Manage data compatibility](https://ubuntu.com/docs/snapcraft/latest/how-to/crafting/manage-data-compatibility/)
- [Snapcraft | snapcraft.yaml](https://ubuntu.com/docs/snapcraft/latest/reference/snapcraft-yaml/)

**Release notes**

I write or review the release notes for all of my team's product releases, but here are
a few release notes I've written for the software I personally maintain at Canonical:

- [Sphinx Stack 1.6](https://documentation.ubuntu.com/sphinx-stack/latest/release-notes/1.6/)
- [Sphinx Stack 2.0](https://documentation.ubuntu.com/sphinx-stack/latest/release-notes/2.0/)
- [sphinx-terminal 1.0.0](https://github.com/canonical/sphinx-terminal/releases/tag/1.0.0)
- [sphinx-terminal 1.1.0](https://github.com/canonical/sphinx-terminal/releases/tag/1.1.0)
