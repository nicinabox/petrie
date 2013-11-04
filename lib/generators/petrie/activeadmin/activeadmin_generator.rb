class Petrie::ActiveadminGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def add_gems
    gem 'font-awesome-rails'
    gem "the_sortable_tree", "~> 2.3.0"
    gem 'sir-trevor-rails', github: 'maxmcd/sir-trevor-rails'
  end

  def copy_templates
    copy_file '_tree.html.erb', 'app/views/admin/pages/_tree.html.erb'
    copy_file 'page.rb', 'app/admin/page.rb'
  end

  def update_page_model
    insert_into_file "app/models/page.rb",
                     :after => %Q(class Page < Petrie::Page) do <<-'RUBY'

  include TheSortableTree::Scopes
      RUBY
    end
  end

  def import_stylesheets
    insert_into_file "app/assets/stylesheets/active_admin.css.scss",
                     :after => %Q(@import "active_admin/base";) do <<-'RUBY'

@import "font-awesome";
@import "sortable_tree";
@import "nested_options";
@import "sir-trevor/icons";
@import "sir-trevor/sir-trevor";

@import "petrie/sir-trevor";
@import "petrie/sortable-tree";
      RUBY
    end
  end

  def require_javascripts
    insert_into_file "app/assets/javascripts/active_admin.js.coffee",
                     :after => %Q(#= require active_admin/base) do <<-'RUBY'

#= require jquery.ui.nestedSortable
#= require sortable_tree/initializer
#= require sir-trevor
#= require sir-trevor/initializer
      RUBY
    end
  end
end
