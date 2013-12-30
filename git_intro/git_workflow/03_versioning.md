!SLIDE transition=cover

Semantic Versioning
===================

or *"How to convey meaning without really trying"*

!SLIDE bullets incremental

Version Numbers...
==================

* generally mean something
* the meaning changes between projects
* end-users are not quite sure what version changes mean
* developers are not quite sure when to change what version numbers

!SLIDE bullets incremental

Introducing Semantic Versioning!
================================

* takes the form of `MAJOR.MINOR.PATCH` (with some stuff after)
* `MAJOR` means incompatible API change
* `MINOR` means backwards-compatible API change
* `PATCH` means no API change

!SLIDE bullets incremental

And Suffixes!
=============

* `-label` (alpha, beta, rc)
* `-label.number` (e.g. `-beta.2` or `-rc.1`)
* `+metadata` (e.g. `+sha.12345`, comes after label if present)

!SLIDE bullets incremental

Benefits
========

* Users know what version changes mean
* Developers know when to increment what
* Dependency listing know what versions they can accept easily ('>=4.3.x && < 5.0.0' means 'version the API of version 4 with the .3 improvements')
