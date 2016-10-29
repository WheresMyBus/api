[![Build Status](https://travis-ci.org/WheresMyBus/api.svg?branch=master)](https://travis-ci.org/WheresMyBus/api)

Building and Testing on the UW CSE Linux VM
===========================================

Installing the UW CSE Linux VM
------------------------------
Setup the VM following the instructions listed at: `https://github.com/WheresMyBus/android/blob/master/README.md`

Installing Dependencies
-----------------------
Install the necessary software by executing `install_ruby.sh`

Before Running or Testing
-------------------------
Tell rvm to use version 2.2.4 of Ruby by running `rvm use 2.2.4`

Building and Running
--------------------
Ruby scripts are converted into binary files at runtime, so no build step is necessary, run the Rails server by executing the command `rails server` from within the repository's top level directory.

Testing
-------
To run the test suite, execute the command `rails test`
