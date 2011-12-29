module Pawi
  class Widget < ActiveRecord::Base
    translates :body
    has_and_belongs_to_many :pages, :join_table => "pawi_pages_widgets"
    validates_presence_of :name, :body
  end
end
