Dir[File.expand_path("../../../app/models/pawi/*.rb", __FILE__)].each {|file| require file}
module Pawi
  class Sweeper < ActionController::Caching::Sweeper
    observe Pawi::Page, Pawi::Widget
 
    def after_create(object)
      expire_cache_for(object)
    end
 
    def after_update(object)
      expire_cache_for(object)
    end
 
    def after_destroy(object)
      expire_cache_for(object)
    end
 
    private
  
    def expire_cache_for(object)
      if object.class==Pawi::Page
        expire_cache(object)
      else
        object.pages.each do |p|
          expire_cache(p)
        end
      end
    end
    
    def expire_cache(object)
      expire_page "/pages/#{object.slug}"
      I18n.available_locales.each do |locale|
        expire_page "#{locale}/pages/#{object.slug}"
      end
    end
  end
end

