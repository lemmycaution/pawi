class CreatePawiWidgets < ActiveRecord::Migration
  def change
    create_table :pawi_widgets do |t|
      t.string :name
      t.text :body
      t.integer :position

      t.timestamps
    end
  end
end
