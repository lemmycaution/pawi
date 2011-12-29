class CreatePawiPages < ActiveRecord::Migration
  def change
    create_table :pawi_pages do |t|
      t.string :name
      t.string :slug
      t.string :format, :default => "html"      
      t.text :body

      t.timestamps
    end
    add_index :pawi_pages, :slug
    add_index :pawi_pages, :format
  end
end
