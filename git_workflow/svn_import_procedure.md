Subverion Import Procedure
==========================

Import
------

1. `svn2git SVN_URL`
2. `cd repo_name`

Prune
-----

1. `cd ..`
2. `git clone monolithic new.tmp`
3. `git filter-branch -f --prune-empty --index-filter 'git rm --cached --ignore-unmatch folder_to_remove/* folder_to_remove2/*' HEAD`
4. `git remote remove origin`
5. `git remote add origin github_clone_url`
6. `cd ..`
7. `git clone new.tmp new`
8. remove 'new.tmp' and fix 'origin' for 'new'
