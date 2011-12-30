module Pawi
  module Generators    
    class InstallGenerator < Rails::Generators::Base
      
      argument :routingfilter, :type => :string, :default => "true"
      argument :activeadmin, :type => :string, :default => "true"      
      
      def add_gems
        # gem 'globalize3'
        gem 'routing-filter' if Boolean(routingfilter)
        # gem 'activeadmin' if Boolean(activeadmin)
      end
      
      def setup_routes
        # route 'mount Pawi::Engine => "/"'
        route 'resources :pages, :only => [:show], :module => "pawi"'
        route "filter :locale" if Boolean(routingfilter)
      end
      
      def create_migrations
        rake("pawi:install:migrations")
      end
      
      private 
      
      def Boolean(string)
        return true if string== true || string =~ (/(true|t|yes|y|1)$/i)
        return false if string== false || string.nil? || string =~ (/(false|f|no|n|0)$/i)
        raise ArgumentError.new("invalid value for Boolean: \"#{string}\"")
      end
      
    end
  end
end