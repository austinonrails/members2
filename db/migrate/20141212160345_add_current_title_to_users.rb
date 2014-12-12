class AddCurrentTitleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_job, :string
  end
end
