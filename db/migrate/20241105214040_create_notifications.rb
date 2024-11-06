class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.references :task, null: false, foreign_key: true
      t.string :info, default: ""
      t.json :data

      t.timestamps
    end
  end
end
