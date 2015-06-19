class CreateToDoLists < ActiveRecord::Migration
  def change
    create_table :to_do_lists do |t|
      t.belongs_to :task, index: true
      t.text :content
      t.integer :priority
      t.integer :estimated_hours

      t.timestamps null: false
    end    
  end
end
