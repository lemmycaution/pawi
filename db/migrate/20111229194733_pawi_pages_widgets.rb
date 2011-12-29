class PawiPagesWidgets < ActiveRecord::Migration
  def self.up
    create_table :pawi_pages_widgets, :id => false do |t|
      t.references :page, :widget
    end
    add_index :pawi_pages_widgets, :page_id
    add_index :pawi_pages_widgets, :widget_id    
  end

  def self.down
     drop_table :pawi_pages_widgets
  end
end
