Versioning
==========

The Bowler projects (will) use [semantic versioning](http://semver.org/).
Git tags are used to keep track of versions.

Overview
--------

Semantic Versioning uses the different components of a version number
(`MAJOR.MINOR.PATCH`) to indicate different change types to the code
base.

* A `MAJOR` version change means that there was an incompatible API change.

* A `MINOR` version change means that a backwards-compatible change was made to the API.

* A `PATCH` version change means that a code change which did not affect the API was introduces
  (generally a bugfix).

Once a version is released, the code for that version should not change.

Suffixes
--------

Following the version number, one of several suffixes, as well as build metadata,
may be added.

Label suffixes follow the version number after a dash ('-').  They include,
in order of ascending precedence:

* alpha
* beta
* rc

A number may follow after a dot ('.') after the label to indicate the version
of the special release (e.g. '2.0.0-rc.2').

Build metadata may be appended after a plus sign ('+') after the label (if present).
For example, '2.0.0-rc.2+sha.34512'.

Versioning and Git
------------------

Version should be denote in Git with git tags.
