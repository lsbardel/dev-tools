
=======================
Git Notepad
=======================

An easy way to keep notes on git usage.

.. contents::
    :local:


Remainders
===============

* Never, ever duplicate a name, lets say a branch and a tag with the same name.


Tags
=========

Tag are static, a snapshot of a repository at a given commit.

* To create a tag::

    git tag -a 0.4.1 -m "Creating the first official version"
    git push --tags
    
* To delete a tag::

    git tag -d 0.4.1
    git push <remote> :0.4.1

  where ``<remote>`` is usually ``origin``.

Branches
===============

* To delete a branch::

    git branch -d mybranch
    
* To delete a branch in a ``remote`` repository

    git push <remote> :mybranch
    
  where ``<remote>`` is usually ``origin``.

Rebase
==============

To see the list of recents commits::

    git show-branch mybranch --more=4	


Dealing with Remotes
===============================

**Aka: maintaining your own branch of a shared project.**

To add a remote to your repo you can perform::

	git remote add upstream git://github.com/xxxxxxx/repo.git
	
where  ``upstream`` is the name given to the remote repository ``git://github.com/xxxxxxx/repo.git``.
You can choose a different name if you like.
 
To ``fetch`` the remote ``upstream``::

	git fetch upstream

The ``fetch`` command is the opposite of the ``pull`` command, while the ``pull`` command
is equivalent to a ``fetch`` followed by a ``merge``, quite different.
**If in doubt use fetch**.

After fetching you can do::

	git log
	
to check the history of changes.

When ready, lets ``rebase`` to the upstream master::

	git rebase upstream/master
	
If there are no conflicts you are ready to commit, otherwise deal with them as
explained in dealing with conflicts.

	git rebase --continue


Dealing with Conflicts
===========================

Useful commands::

	git ls-files -u
	
will show a list of unmerged files, very useful during a merge/rebase operation.

To check the differences in unmerged file ``whatever.h`` type::

	git diff whatever.h
	

Submodules
=================

To add links to other git projects you can use the ``submodule`` command::

    git submodule add git@github.com:lsbardel/plugin.git libs/plugin

make sure you add the ``.gitmodules`` to your repo::

    git add .gitmodules
    
When you add the submodule, the most recent commit of the submodule
is stored in the main repository's index. That means that as the code
in the submodule's repository updates, the code in your repo won't.
This is not like the default behaviour of ``svn:externals`` where it will track the latest
revision at the time.

To update your submodule is do it as it was e suparate repository, which in fact it is.
You move to the submodule location ``libs/plugin`` ::

    git remote update
    
    git merge origin/master
    
Commit and you are done.

When you clone a repository with submodules you need to issue the following two commands once
your clone is ready::

    git submodule init
    git submodule update
    


    