# README

## Description

This app serves as the backend api server for Plantarooni, a web application for remote controlled greenhouse system.


## Ruby Version

As of writing, the ruby version in use is 2.3.1


## Requirements

1. Git 2.11.0 or higher
2. Ruby on Rails
3. SQLITE3
4. Greenhouse system.
5. Preprogrammed Raspberry Pi.


## Installing Rails on Windows and Setting up the App

1. Download ruby on rails [here](http://railsinstaller.org/en)
2. Install Ruby on Rails to C:\RailsInstaller
3. After installing, clone the repo.
4. After cloning or checkout, go inside the folder. ex: `cd plantarooni`
5. run `bundle install`


## Database Creation

1. After `bundle install`, run `rails db:create`
2. run `rails db:migrate`
3. run `rails db:migrate RAILS_ENV=test`


## Database initialization

Preseeded data can be located in db/seeds.rb. An administrator is created whenever the database is seeded with necessary data for the system to run.

1. run `rails db:seed`


## How to run the test suite

The test suite of this app is Rspec.

1. run `rspec spec/apis/<name of file>`


