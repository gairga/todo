class AddStatusToTaskDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :task_details, :status, :boolean, default: false
  end
end
