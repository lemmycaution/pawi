class TranslatePawiWidgets < ActiveRecord::Migration
  def self.up
    Pawi::Widget.create_translation_table!({
      :body => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Pawi::Widget.drop_translation_table! :migrate_data => true
  end
end
