# Contribution Guide

Thanks for thinking of contributing! Before you get started, just make
sure you have a look at this guide so your contribution can be added to
the project efficiently. It's also a guide that we use internally between
the major collaborators of the project!

## Table of Contents

 - [Style Guides](#style-guides)
 - [Adding Features or Content](#adding-features-or-content)
 - [Naming Branches](#naming-branches)
 - [Modification of Dependencies](#modification-of-dependencies)
   - [Modifying Ruby dependencies](#modifying-ruby-dependencies)
   - [Modifying Node.js dependencies](#modifying-nodejs-dependencies)

## Style Guides

The basic style guide to follow for your HTML &amp; CSS is [codeguide.co](http://codeguide.co/).

Any additional style guides listed in this section should be seen as overriding to this style guide.

## Adding Features or Content

When adding features or content, please always follow this workflow:

 1. **Ensure that a need for this feature or content is present.** Every feature
 request, bug fix, documentation update, enhancement, etc. should always have its own
 issue associated with it. The issue is the place where discussion happens about whether
 or not that certain problem needs to be addressed and if so, what is the best way to
 do it. Before these discussions take place, no PR should be opened and no code should
 be written in any fork/branch. If no issue exists yet for your idea, create a new issue
 and await proper feedback before implementing it.
 2. **Create a PR as soon as you have code ready.** The existence of the PR shows that work
 is being done on the issue and also provides all contributors and viewers with status updates
 regarding the issue - rather than each contributor having to subscribe to separate branches
 and forks. There are labels to indicate whether the status of a PR - use them to signify
 whether or not your PR needs to be merged yet. Keep these up-to-date as you work.
 3. **Follow the style guides.** For different code changes, there are different style guides
 that we try to stick to. To see a complete list, checkout the section [Style Guides](#style-guides).
 4. **Internal use: never merge your own PR.** This really only applies to official collaborators of
 the project, but please do not ever merge a PR that you opened. Assign a reviewer and await approval
 for your PR. After approval, still do NOT merge your own PR - let the reviewer do it.

## Naming Branches

For collaborators, this is a set of rules for branch naming that we follow.

For contributors, this is a good way to know what is/isn't being worked on.

 - `master`: the current stable (deployed) version of the code.
 - `development`: active branch that all PRs get merged into - this will always be the next release.
 - `fix_n`: a branch where issue `n` is being fixed.

Code cycle: `fix_n` => `development` => `master`

## Modification of Dependencies

The dependencies of the project are defined in two places: the `Gemfile` and
`package.json`.

 - `Gemfile`: defines the (ruby) dependencies that must be installed via `bundler` or `gem install`.
 - `package.json`: defines the (node.js) dependencies that must be installed via `npm`.

### Modifying Ruby dependencies

Things to remember when modifying the Ruby dependencies:

 - Updates to the `Gemfile` should be absolutely minimal.
  - If it's possible to only commit the single change to the `Gemfile` (& `Gemfile.lock`),
  then only commit that.
  - If config files need to be updated/added, add those in your commit.
  - Do NOT modify any other files in a commit that modifies the `Gemfile`.
 - Run `bundle install` locally BEFORE committing. This will generate updates in
 `Gemfile.lock` that reflect your `Gemfile` changes. These changes should be included
 in your commit.

### Modifying Node.js dependencies

Things to remember when modifying the Node.js dependencies:

 - Updates to the `package.json` should be absolutely minimal.
  - If it's possible to only commit the single change to the `package.json` (& `npm-shrinkwrap.json`),
  then only commit that.
  - If config files need to be updated/added, add those in your commit.
  - Do NOT modify any other files in a commit that modifies the `package.json`.
 - Run `npm install && npm shrinkwrap` locally BEFORE committing. This will generate updates in
 `npm-shrinkwrap.json` that reflect your `package.json` changes. These changes should be included
 in your commit.