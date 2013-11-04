# Petrie

Pages for your Rails app. Includes support for ActiveAdmin and Sir Trevor. Built for Rails 4.

## Install

    gem install petrie

or add to your Gemfile

    gem 'petrie'

Then run the installer

    rails g petrie:install
    rake db:migrate

## ActiveAdmin

    rails g petrie:activeadmin

# Caution

Petrie includes a root route to `pages#home`. Generally, this shouldn't be a problem unless you don't want to use a marketing home page as your root.

## License

MIT License
