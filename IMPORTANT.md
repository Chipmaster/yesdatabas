You now need to install bcrypt-ruby.  To do this on windows, you'll need to have a build toolchain.  Follow the steps here to install that (first answer): http://stackoverflow.com/questions/1666511/installing-bcrypt-ruby-gem-on-windows

Then just 'gem install bcrypt-ruby.'

You'll also want to do the normal 'rake db:migrate' after you 'svn update'