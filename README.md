# Petrie

Pages for your Rails app. Includes support for ActiveAdmin and Sir Trevor. Built for Rails 4.

![Admin](screenshot-activeadmin.png?raw=true)

## Install

    gem install petrie

or add to your Gemfile

    gem 'petrie'

Then run the installer

    rails g petrie:install
    rake db:migrate

## ActiveAdmin

**Heads up!** You need to have ActiveAdmin installed first!

    rails g petrie:activeadmin

# Caution

Petrie includes a root route to `pages#home`. Generally, this shouldn't be a problem unless you don't want to use a marketing home page as your root.

# Known issues

* There are missing blocks in sir-trevor-rails that will cause template errors. The workaround is to create these blocks in your application in `app/views/sir-trevor/blocks` until this gets fixed.

## License

MIT License


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/nicinabox/petrie/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

