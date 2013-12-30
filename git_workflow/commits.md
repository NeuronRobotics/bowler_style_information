Commits
=======

Git commits for the Bowler project should be clean and readable.
There should **NEVER** be commits with empty messages.

A good general guide is the
[OpenStack Git Commit Message Best Practices](https://wiki.openstack.org/wiki/GitCommitMessages).

Overview
--------

There are two types of commits: commits which get pushed to the repository,
and commits which occur only on your local machine.

### Public Commits ###

A commit should cover one particular change, which may or may not
be across multiple files.  If there are multiple changes, they should
probably be across multiple files.

Commits which are pushed to the major branches should not have superbly
broken code (as opposed to subtly broken code, which is hard to catch).

For instance suppose we are working on a new feature which implements
transparent autodetection where before we were using a configuration
option directly.

In this feature, there are two main changes: adding a property and converting
all places where the configuration option was used directly, and adding the
autodetection code to the property.  This means that there are two commits.

The first commit should replace all instances of the configuration option
with the the property, and make the property simply return the configuration
option.  The second commit should introduce the autodetection code to the
property.

Notice that we did not simply replace all instances of the configuration
option with the property without actually implementing the old functionality
to the property.  This would have created a commit that introduces superbly
broken code.

See below for an example of the commit messages for these changes.

### Private Commits ###

While working on your local machine, or in a forked repository on
your personal GitHub account, it may be adventageous to commit code
as you think you complete a part of a feature, and then fix errors
you encounter as you continue the development of the feature.

For example, consider the following summary commit messages

* implemented first part of feature xyz
* fix issue in first part of xyz where qpw
* implemented second part of feature xyz
* implemented third part of xyz, and added
  mnl to the first part
* implemented fourth part of xyz, and
  fixed an issue in the second part

Such a series of commit messages is okay for your personal development,
but should never reach the central upstream repository.  Before you push
to the upstream repository or submit a pull request, your changes should
be rebased using `git rebase --interactive`.

For example, the commits above should become four commits:

* implemented first part of feature xyz
* implemented second part of feature xyz
* implemented third part of feature xyz
* implemented fourth part of feature xyz

Note that if the second part will not work without the third part, then
there should really only be three commits: part 1, part 2/3, and part 4.

Commit Message Format
---------------------

Commit messages should have three sections: a summary,
a description, and flags.

For example, consider the following two commits (remember that
the commit hash, author, and date are inserted automatically):

```
commit 3114a97ba188895daff4a3d337b2c73855d4632d
Author: directxman12
Date:   Sun Dec 29 20:00:20 2013 -0500

Convert uses of `conf.XYZ` to property `xyz`

Currently, the `conf.XYZ` configuration option
is used to determine the what XYZ is.  However,
this is not particularly friendly to code that
dynamically determines the value of XYZ.  Instead,
whenever something needs to determine what XYZ is,
it now uses the property `xyz` of class `Foo`,
which returns the value of `conf.XYZ`.

See #123

commit 573ada525b8a7384398a8d7d5f094f343555df56
Author: directxman12
Date:   Sun Dec 29 20:20:20 2013 -0500

Implement XYZ Autodetection

Previously the `xyz` property of class `Foo`
had to be hardcoded using the `XYZ` configuration
option.

Now, the value of the configuration option can
be set to auto, in which case `xyz` property will
use the QPR API to introspect for what XYZ currently
is.

Closes #123
```

### Summary ###

The summary should be a sentence-cased brief description of the commit.
It should be at most 72 characters log, and should not end in a period ('.').

### Description ###

The description should be an extend explanation of what the changes made in
the commit were, and the ramifications therein.  Lines in the commit should wrap
where convinient, optimally between 50 and 72 characters.  You should provide a
detailed description of the rationale behind the change, as well as the contents
and effects of the change.  Assume the reader of the commit message is familar with
the project, but not necessarily the specific details of the particular part of the
project.  Like code, avoid lines ending with whitespace.

### Flags ###

The flags should be used for information in commit hooks.  This mainly involves
the GitHub autoclosing features ('closes', 'fixes', etc -- see
https://help.github.com/articles/closing-issues-via-commit-messages).  You can
also simply mention an issue or pull request by writing down the issue number with
a '#' sign in front (you should also have the number sign for 'closes', etc).  You
should add a word or two in front (for human readability), such as 'See', or 'Related
To'.
