class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content, null: false
      t.boolean :read, null: false, default: false
      t.references :notifiable, polymorphic: true, null: true

      t.timestamps
    end
  end
end