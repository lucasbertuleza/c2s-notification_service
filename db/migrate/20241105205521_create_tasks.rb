class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :uuid, limit: 36, null: false, index: {unique: true}
      t.string :user, limit: 510, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
