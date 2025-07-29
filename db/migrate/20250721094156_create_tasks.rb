class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :body, null: false
      t.datetime :limit_date
      t.integer :state
      t.references :user, foreign_key: true 
      t.timestamps
    end
  end
end
