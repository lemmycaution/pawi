module Pawi
  module Generators
    class ViewsGenerator < Rails::Generators::Base

      source_root File.expand_path("../../../../app/views/pawi", __FILE__)

      def setup_directory
        empty_directory "app/views/pawi"          
        directory 'pages', 'app/views/pawi/pages'
      end

    end
  end
end