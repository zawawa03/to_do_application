class RenameLimitDateColumnToTasks < ActiveRecord::Migration[7.1]
  def change
    rename_column :tasks, :limit_date, :start_time
  end
end
