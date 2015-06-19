class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps null: false
    end
  end
end
