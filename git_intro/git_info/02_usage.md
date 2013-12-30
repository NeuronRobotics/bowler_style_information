!SLIDE transition=cover

How To Git
==========

!SLIDE commandline incremental

Get a Project
=============

    $ git clone \
      git@github.com:NeutronRobotics/bowler_style_information.git
    Cloning into 'bowler_style_information'...
    remote: Counting objects: 20, done.
    remote: Compressing objects: 100% (14/14), done.
    remote: Total 20 (delta 1), reused 16 (delta 1)
    Receiving objects: 100% (20/20), 6.42 KiB, done.
    Resolving deltas: 100% (1/1), done.
    $ cd bowler_style_information
    $ git status
     # On branch master
     nothing to commit, working directory clean

!SLIDE subsection transition=cover

The Git Process
===============

Git is a bit wierd...

!SLIDE bullets incremental

Life Cycle
==========

1. **untracked**: not in the repository
2. **unmodified**: in the repository, not modified
3. [`vim xyz`] **modified**: edited, but the edits have not been recorded
4. [`git add xyz`] **staged**: the *edits* (not the whole file) are staged to be committed
5. [`git commit`] **comitted**: the *edits* are stored as a commit in your local repository

!SLIDE

Wait, WTF Does "Staged" Means?
==============================

!SLIDE smbullets incremental

Staged Changes
==============

* once changes have been made, they must be staged
* changes go into the "index" (staging area), not files
* a given file can show as both staged and unstaged
* this lets us add only certain changes in a file to a commit
* the index also lets us specify which files to "stash" (discussed later),
  mark conflicts as resolved, and more

!SLIDE

Remember!
=========

!SLIDE commandline incremental

To Stage Files:
===============

    $ git add .

    or

    $ git add xyz

    or

    $ git add --patch xyz

    or

    $ git add --edit xyz

!SLIDE commandline incremental

To commit staged changes:
=========================

    $ git commit

!SLIDE commandline incremental

To unstage changes:
===================

    $ git reset HEAD xyz

!SLIDE commandline incremental

To discard unstaged changes:
============================

    $ git checkout xyz

!SLIDE commandline incremental

To push (the current branch) changes to a remote
================================================

    $ git push remote-name remote-branch-name

!SLIDE

Whoah, whoah, whoah, what is a "remote"?
========================================

!SLIDE bullets incremental

Remotes are...
==============

* any non-local repository
* a repository on the machine of another developer
* a central repository on GitHub

!SLIDE subsection transition=cover

Altering the Timeline
=====================

Branching, Merging, Rebasing, and Stashing
------------------------------------------

!SLIDE

Replaying and the Branching Timeline
====================================

In the following sections, you will see the phrase
*replay the changes*.  To understand what this means,
think of the Git timeline as a series of beeps on a
audio file, where each beep is a commit.  When you *replay*
changes over an existing set of changes, it is like playing two
of the beeping audio files at the same time, and then saving the
results.  The resulting file is the interleaving of the two sets
of beeps.

!SLIDE commandline incremental

Branching
=========

To create and then switch:

    $ git checkout -b some-new-branch

To switch later:

    $ git checkout some-existing-branch

To delete a (merged) branch:

    $ git branch -d branch-name

To force-delete any branch

    $ git branch -D branch-name

!SLIDE commandline incremental

Merging
=======

Pulls the changes from another set of commits (a branch, etc)
into the current branch, replaying the current new commits
onto the current branch and **then recording the results in
a new commit**

    $ git merge other-branch-name

(or from a remote -- rebasing is preferred to this, though)

    $ git pull remote remote-branch

!SLIDE commandline incremental

Rebasing
========

Alters history, changing history without making a new commit

Replay another branch over this one:

    $ git rebase branch-name

Pull a new set of changes from a remote:

    $ git pull --rebase remote remote-branch

Manipulate the timeline directly:

    $ git rebase --interactive revision-specifier

!SLIDE

Wait, how is that different from merging?
=========================================

**Merging** is like sticking a signpost on the timeline saying
*"here git, there are some other changes for you to
consider over the history of time"*

**Rebasing** is like saying:
*"what do you mean git, Julius Caesar always had a laser pistol?,
I don't know what you're talking about.  Pfft, changing history!"*

!SLIDE smbullets

So when should I use what?
==========================

* Use **merging** when you want an official record of the timeline changes,
  such when you want to put your changes from a feature branch into
  develop

* Use **rebasing** when you want to seamless change history, such as when
  you pull changes from the GitHub repository

* Use **rebasing** when you want to change how your commits looked in the past,
  such as when you want to clean up a series of commits or fix an issue in an
  older commit.

!SLIDE

The Rebasing Prime Directive:
============================

**Only ever rebase if it will not conflict with the timeline of someone else**
------------------------------------------------------------------------------

!SLIDE

I had another question, though:
===============================

What is a revision specifier?
-----------------------

!SLIDE bullets incremental

A revision specifier is...
==========================

* a single commit SHA or short SHA
* a RefLog name (e.g. `HEAD@{0}`)
* a ancestor of a commit ('~' or '^' after an one of the above)
* a range (using '..' or '...') of any of the above

See [http://git-scm.com/book/en/Git-Tools-Revision-Selection](http://git-scm.com/book/en/Git-Tools-Revision-Selection)

!SLIDE commandline incremental

Stashing
========

Puts the currents in a separate pocket to be taken out later
(numbered in a stack-like manner):

    $ git stash

(or only the unstaged changes)

    $ git stash --keep-index

Apply the contents of the stash:

    $ git stash apply [stash@{number}]

Apply then remove:

    $ git stash pop [stash@{number}]

!SLIDE commandline incremental

Remove:

    $ git stash remove [stash@{number}]

Start a branch from a stash:

    $ git stash branch branch-name [stash@{number}]

List all stashes:

    $ git stash list

Show information about a stash:

    $ git stash show [stash@{number}]

!SLIDE subsection transition=cover

Tags
====

Like bookmarks in time...

!SLIDE commandline incremental

Tagging
=======

A tag is really just a name for a particular point in history

List all tags:

    $ git tag

Search all tags with filter:

    $ git tag -l 'pattern'

Create a lightweight tag:

    $ git tag tag-name [revision]

Create an annotated tag:

    $ git tag -a tag-name [revision]


!SLIDE commandline incremental


Note that you must explicitly push tags to remotes:

    $ git push remote-name tag-name

You can also create and verify GPG-signed tags, if you really want to:

    $ git tag -s tag-name [revision]
    $ git tag -v tag-name
