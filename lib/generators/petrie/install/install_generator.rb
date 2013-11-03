class Petrie::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_models
    copy_file 'pages_controller.rb', 'app/controllers/pages_controller.rb'
  end

  def copy_views
    copy_file 'home.html.erb', 'app/views/pages/home.html.erb'
    copy_file 'show.html.erb', 'app/views/pages/show.html.erb'
  end

  def copy_controllers
    copy_file 'page.rb', 'app/models/page.rb'
  end

  def install_migrations
    rake "petrie_engine:install:migrations"
  end

end
