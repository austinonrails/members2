class AddVariousColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :website_url, :string
    add_column :users, :github_url, :string
    add_column :users, :linkedin_url, :string
    add_column :users, :twitter_handle, :string
    add_column :users, :bio, :text
    add_column :users, :email_visible, :boolean, default: false
  end
end
