class AddPasswordDigestToUsers < ActiveRecord::Migration[5.1]
  def change
                #tablename
    add_column :users, :password_digest, :string
  end
end
