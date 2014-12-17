class AddJoinedAorOnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :joined_aor_on, :date
  end
end
