class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :status
      t.belongs_to :project, index: true

      t.timestamps null: false
    end    
  end
end
