class Task < ApplicationRecord
  # t.string "name", null: false
  #  t.string "body", null: false
  #  t.datetime "limit_date"
  #  t.integer "state"
  #  t.bigint "user_id"
  #  t.datetime "created_at", null: false
  #  t.datetime "updated_at", null: false
  #  t.index ["user_id"], name: "index_tasks_on_user_id"
  
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 65_535 }

  enum state: { doing: 0, done: 1 }
end
