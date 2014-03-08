Git Submodules
==============

Git submodules allow you to link a directory inside one repository
to another repository.  Cough-cough, NR-Clib, cough-cough.

See http://git-scm.com/book/en/Git-Tools-Submodules

Adding a submodule
------------------

```bash
$ git submodule add git://github.com/neuronrobotics/some_repo.git directory_path
$ git add .gitmodules
$ git add directory_path
$ git commit
```

Clone a repo with submodules
----------------------------

```bash
$ git clone --recursive some_repo_url
```

**or**

```bash
$ git clone some_repo_url
$ cd some_repo
$ git submodule init
```

Update the submodules in a repo
-------------------------------

(this updates the contents of the local directory)

```bash
$ git submodule update
```
