Socrates
========

If you have to write small programs and want to use the power of Rails you can use Socrates as a starting point.

You will have app/models, migrations, bundle, command line parser.

If you add a Gem in the Gemfile, don't forget to require it in the lib/application.rb

Have a nice time

How to install
==============

Install ruby language
Then install install rubygems and do

  # gem install bundler

Enter this folder and do

  # bundle install

How to create your development database (if you want to use mysql)

  # mysql -e "drop  database socrates_development" ; mysql -e "create database socrates_development DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;"; rake db:migrate --trace

How to run
==========

  ruby app/main.rb

