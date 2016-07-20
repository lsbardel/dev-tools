# Git Notes
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Intro](#intro)
  - [Useful external links](#useful-external-links)
  - [Remainders](#remainders)
- [Pulling & fetching](#pulling-&-fetching)
  - [Pulling into a dirty tree](#pulling-into-a-dirty-tree)
- [Tags](#tags)
- [Branches](#branches)
  - [Merging branches](#merging-branches)
  - [Renaming a branch](#renaming-a-branch)
  - [View and discard changes](#view-and-discard-changes)
  - [Deleting a branch](#deleting-a-branch)
  - [Renaming again](#renaming-again)
  - [Compare branches](#compare-branches)
  - [Rebase](#rebase)
- [Dealing with Remotes](#dealing-with-remotes)
  - [Dealing with Conflicts](#dealing-with-conflicts)
- [Submodules](#submodules)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Intro

### Useful external links

* [Kernel Hackers' Guide to git](http://linux.yyz.us/git-howto.html)

### Remainders

* Never, ever duplicate a name, lets say a branch and a tag with the same name.

## Pulling & fetching

### Pulling into a dirty tree

When you are in the middle of something, you learn that there are upstream changes
that are possibly relevant to what you are doing. When your local changes do not conflict with the changes
in the upstream, a simple git pull will let you move forward.

However, there are cases in which your local changes do conflict with the upstream changes,
and ``git pull`` refuses to overwrite your changes. In such a case, you can ``stash`` your changes away,
perform a pull, and then ``unstash``, like this:
```
    $ git pull
     ...
    file foobar not up to date, cannot merge.
    $ git stash
    $ git pull
    $ git stash pop
```

### Clean up

Use ``git clean`` to remove untracked files/directories. By default, it will only print what it would have removed, without actually removing them.

Given the -f flag to remove the files, and the -d flag to remove empty directories as well :
```
git clean -df
```
Also removing ignored files:
```
git clean -dfx
```
## Tags

Tag are static, a snapshot of a repository at a given commit.

* To create a tag:
```
    git tag -a 0.4.1 -m "Creating the first official version"
    git push --tags
```
* To delete a tag:
```
    git tag -d 0.4.1
    git push <remote> :0.4.1
```
  where ``<remote>`` is usually ``origin``.

## Branches

* To check out a local working branch:
```
    git checkout -b test
```    
  This method will copy the current branch to the ``test``.  
* To check out a local working branch based on a remote branch ``origin/test``
  you need to check it out with:
```
    git checkout -b test origin/test
```    
* To delete a branch:
```
    git branch -d mybranch
```    
* To delete a branch in a ``remote`` repository:
```
    git push <remote> :mybranch
```    
  where ``<remote>`` is usually ``origin``.

### Merging branches

To merge and prefer the version of the ``branch`` being merged:
```
    git merge branch -X theirs    
```

### Renaming a branch

The best way in my opinion is to use ``ours`` merge strategy to overwrite
branch `a` with branch `b`:
```
    git checkout b
    git merge -s ours a
    git checkout a
    git merge b
```
The result should be your branch ``a`` is now essentially branch ``b``.

### View and discard changes

Sometimes you make local changes and commit them without pushing to remote.
To see the history of these local commits and the differences:
```
git log origin/master..HEAD
git diff origin/master..HEAD
```
And sometimes you would like to discard these local commits:
```
git reset --hard origin/master
```

### Deleting a branch

To delete a branch ``mybranch`` in a ``remote`` repository:
```
    git push origin :mybranch
```    

### Renaming again

Another, more convoluted, way to rename, on your local repo:
```
    git branch -m master old-master
```    
move the ``master`` branch to a local new name ``old-branch``. Then:
```
    git branch -m mybranch master
```    
move ``mybranch`` to ``master`` name.

Now, time to mess with the remote. Just in case you screw up, you might want to make
sure you have a current backup. First, delete the remote's master:
```
    git push origin :master
```    
And now, give the remote your new master:
```
    git push origin master:refs/heads/master
```
and your now-renamed old master:
```
    git push origin old-master:refs/heads/old-master
```    
Finally, delete the old name of your maintenance branch to prevent confusion:
```
    git push origin :mybranch
```

### Compare branches

To identify the files which are different between two branches:
```
    git diff --name-status master..mybranch
```    
which is similar to:
```
    git diff --name-only master..mybranch
```    
but the best is:
```
    git diff --stat --color master..mybranch
```    
And to check the actual differences in a file:
```
    git diff mybranch master -- myfile.cs
```    

### Rebase

To see the list of recents commits:
```
    git show-branch mybranch --more=4
```

## Dealing with Remotes

**Aka: maintaining your own branch of a shared project.**

To add a remote to your repo you can perform:
```
	git remote add upstream git://github.com/xxxxxxx/repo.git
```
where  ``upstream`` is the name given to the remote repository ``git://github.com/xxxxxxx/repo.git``.
You can choose a different name if you like.

To ``fetch`` the remote ``upstream``:
```
	git fetch upstream
```
The ``fetch`` command is the opposite of the ``pull`` command, while the ``pull`` command
is equivalent to a ``fetch`` followed by a ``merge``, quite different.
**If in doubt use fetch**.

After fetching you can do:
```
	git log
```
to check the history of changes.

When ready, lets ``rebase`` to the upstream master:
```
	git rebase upstream/master
```
If there are no conflicts you are ready to commit, otherwise deal with them as
explained in dealing with conflicts:
```
	git rebase --continue
```

### Dealing with Conflicts

Useful commands:
```
	git ls-files -u
```
will show a list of un-merged files, very useful during a merge/rebase operation.

To check the differences in un-merged file ``whatever.h`` type:
```
	git diff whatever.h
```

## Submodules

To add links to other git projects you can use the ``submodule`` command:
```
    git submodule add git@github.com:lsbardel/plugin.git libs/plugin
```
make sure you add the ``.gitmodules`` to your repo:
```
    git add .gitmodules
```    
When you add the submodule, the most recent commit of the submodule
is stored in the main repository's index. That means that as the code
in the submodule's repository updates, the code in your repo won't.
This is not like the default behaviour of ``svn:externals`` where it will track the latest
revision at the time.

To update your submodule is do it as it was e suparate repository, which in fact it is.
You move to the submodule location ``libs/plugin``:
```
    git remote update
    git merge origin/master
```
Commit and you are done.

When you clone a repository with submodules you need to issue the following two commands once
your clone is ready:
```
    git submodule init
    git submodule update
```    
