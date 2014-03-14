# Contact Manager

We're going to work on changing this application so that all of the contact
information is stored in a database using [Active Record](https://github.com/rails/rails/tree/master/activerecord).

Active Record provides an interface for interacting with your database and
converting your results into Ruby objects.

## Setting Up Active Record in Your Sinatra App

In order to get Active Record working with Sinatra, we're going to use the
[sinatra-activerecord gem](https://github.com/janko-m/sinatra-activerecord).

Add the following gems to your Gemfile:

```no-highlight
gem 'sinatra-activerecord'
gem 'pg'
gem 'rake'
```

**Don't forget to run `bundle install`.**

Now require it in your Sinatra application file:

```ruby
require "sinatra/activerecord"
```

Configure your database by creating a `config/database.yml` with the following:

```ruby
# Configure the database used when in the development environment
development:
  adapter: postgresql
  encoding: unicode
  database: <YOUR_APP_NAME>_development
  pool: 5
  username:
  password:

# Configure the database used when in the test environment
test:
  adapter: postgresql
  encoding: unicode
  database: <YOUR_APP_NAME>_test
  pool: 5
  username:
  password:

# Configure the database used when in the production environment
production:
  adapter: postgresql
  encoding: unicode
  database: <YOUR_APP_NAME>_production
  pool: 5
  username:
  password:
```

`sintatra-activerecord` also gives us a bunch of rake tasks that allow us to
create our database, add/drop tables, etc. Rake tasks are basically just ruby
scripts that you can run from the command line.

Require the rake tasks by creating a `Rakefile` with the following:

```ruby
require "sinatra/activerecord/rake"
require "./app"
```

That's it! Now you've got your Sinatra app ready to store data in a database in the same
way that Rails does.
