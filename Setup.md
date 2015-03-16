# Instructions #

> ## Setting up Ruby ##

  * Download Ruby from http://rubyinstaller.rubyforge.org/

  * When installing, make sure you add ruby and gems to the Windows Path

  * C:\> gem install rails --include-dependencies

  * C:\> gem install -v=2.3.4 rails

  * C:\> gem install sqlite3-ruby

  * Download the [SQLite3 DLL](http://www.sqlite.org/sqlitedll-3_6_22.zip), unzip it, and copy it to your C:\Ruby\bin folder.

> ## Initializing the Project ##
    * C:\> svn checkout https://yesdatabas.googlecode.com/svn/trunk/ yesdatabas --username YourUserName

  * You'll need your googlecode password from here:  https://code.google.com/hosting/settings

> ## Final Thoughts ##
> > We have to standardize which versions of software we are using.  Since the hosting we have uses specific versions of ruby and rails, we should standardize around this.