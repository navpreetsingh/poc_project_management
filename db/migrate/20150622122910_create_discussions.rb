class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.text :content
      t.belongs_to :user, index: true
      t.references :main_discussion, index: true

      t.timestamps null: false
    end        
  end
end
