module Pawi
  class Page < ActiveRecord::Base
    translates :body
    has_and_belongs_to_many :widgets, :join_table => "pawi_pages_widgets"
    before_save :set_slug
    validates_presence_of :name, :body
        
    private

    def set_slug
      self.slug = "#{self.name.parameterize}"
    end
    
  end
end
