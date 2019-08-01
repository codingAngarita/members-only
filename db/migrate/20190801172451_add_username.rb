class AddUsername < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :user_username, :string
  end
end
