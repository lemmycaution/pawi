class TranslatePawiPages < ActiveRecord::Migration
  def self.up
    Pawi::Page.create_translation_table!({
      :body => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Pawi::Page.drop_translation_table! :migrate_data => true
  end
end
