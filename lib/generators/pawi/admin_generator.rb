module Pawi
  module Generators
    class AdminGenerator < Rails::Generators::Base

      source_root File.expand_path("../../../../app/admin", __FILE__)
      public_task :copy_views

      def copy_views
        begin
          ActiveAdmin.nil?
          empty_directory "app/admin"          
          template 'pawi_pages.rb', 'app/admin/pawi_pages.rb'
          template 'pawi_widgets.rb', 'app/admin/pawi_widgets.rb'
        rescue
          puts "NOTE: ActiveAdmin not installed!"
        end
      end

    end
  end
end