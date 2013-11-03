require 'friendly_id'
require 'awesome_nested_set'

module Petrie
  class Engine < ::Rails::Engine
    isolate_namespace Petrie

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
