class AddPasswordDigestAndAvataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :avatar, :string
  end
end
