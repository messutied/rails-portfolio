module Portfolio
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc <<-DESC.strip_heredoc
        Description:
            Installs portfolio into the current app

        Example:
            rails generate portfolio:install

            This will create:
                config/initializers/portfolio.rb
            And insert into:
                config/routes.rb
                app/assets/javascripts/application.js
                app/assets/stylesheets/application.css
      DESC

      def copy_initializer_file
        copy_file 'initializer.rb', 'config/initializers/portfolio.rb'
      end

      def mount_engine
        route "\n  mount Portfolio::Engine, at: '/portfolio'\n"+
              "  # root 'portfolio/items#default'\n\n"
      end

      def insert_javascript
        inject_into_file 'app/assets/javascripts/application.js', after: "//= require jquery\n" do
          "//= require portfolio/application\n"
        end
      end

      def insert_stylesheets
        inject_into_file 'app/assets/stylesheets/application.css', before: "\n */" do
          "\n *= require portfolio/application"
        end
      end
    end
  end
end
