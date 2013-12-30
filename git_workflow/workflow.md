Git Workflow
============

The Bowler project (will) follow a basic branching workflow, as
per the [Git Book](http://git-scm.com/book/en/Git-Branching-Branching-Workflows),
slightly modified to be more similar to the
[@nvie git-flow workflow](http://nvie.com/posts/a-successful-git-branching-model/).

Major Branches
--------------

There are three main branches in this workflow: *master*, *develop*, and *bugfix*.

### Master ###

The *master* branch holds the stable code, and represents releases
and hotfix versions.  Code should *only* be in this branch if it is known
to be stable.  Before code is merged into the *master* branch, it should
be merged into the *develop* branch or *bugfix* branch.

### Develop ###

The *develop* branch holds the latest and greatest working code.
Code on this branch should be relatively stable (yet may be somewhat
unstable).  Think of this as similar to CyanogenMod nightlies: they work,
but they may have some issues.  **Broken code does not belong here**.
While much of the code here will come from merging feature and refactor
branches, commits may be made directly here if using a single commit or pair
of commits to fix an issue in an already-merged branch.

### Bugfix ###

The *bugfix* branch holds fixes to the current stable code.  Fixes from this
branch should be merged into *master* and *develop*.

Minor Branches
--------------

Minor branches are used to separate out actions into distinct histories, and to
keep track of code before it is stable enough to be merged into *develop*.

There are three main categories of minor branches: *feature/*, *bug/*, and *refactor/*.
After minor branches are merged, they should be deleted.

### Feature Branches ###

Feature branches (*feature/some-name*) should be used when developing new features.
While code here should not be completely broken, it does not necessarily have to work
completely.  Use feature branches to develop new features in a way that still enables
collaboration without interrupting the coding of other developers.  Once features are
complete in the feature branch, the should be merged back into the *develop* branch.

### Bug Branches ###

Bug branches (*bug/some-number-some-description*) are used to develop bugfixes for
issues filed in the bug tracker against stable or unstable code.  Develop the fix as
one or more commits, and then merge the fix into *develop* and/or *master* (if the bug
was in stable code, merge into both.  If the bug was in *develop*, merge only into develop.
If the bug was fixed an issue no long present in *develop*, just merge into *master*).

### Refactor Branches ###

Refactor branches (*refactor/some-description*) should be used for small and large code
refactorings.  If the refactoring is one general idea that needs to be applied to multiple
files (e.g. "use code injection"), make the changes as a series of commits, one for each file
or class affected.  Once all changes have been made, merge the branch into *develop*.
