require "pawi/engine"
require "pawi/sweeper"

module Pawi
  
  @@default_format = "html"
  mattr_accessor :default_format
  @@available_formats = %w( html mobile mail)
  mattr_accessor :available_formats
  
  module Controller
    
    extend ActiveSupport::Concern
    
    included do
      before_filter :set_locale
    end
    
    module InstanceMethods
      def set_locale

        unless params[:locale].nil?
          plocale = params[:locale].to_sym unless I18n.available_locales.index(params[:locale].to_sym).nil?
        end

        # I18n.locale = plocale || ( extract_locale_from_accept_language_header || I18n.default_locale )
        I18n.locale = plocale || I18n.default_locale
        if I18n.available_locales.index(I18n.locale.to_sym).nil?
          I18n.locale = I18n.default_locale
        end
        
        # protected
        # 
        #         def extract_locale_from_accept_language_header
        #           request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first unless request.env['HTTP_ACCEPT_LANGUAGE'].nil?
        #         end
      end
    end
    
  end
  
end

::ActionController::Base.send :include, Pawi::Controller
