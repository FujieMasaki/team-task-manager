class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.string :status, null: false, default: 'todo'
      t.string :priority, null: false, default: 'medium'
      t.date :due_date
      t.references :project, null: false, foreign_key: true
      t.references :assignee, foreign_key: { to_table: :users }
      t.references :created_by, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end