class AddLastNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :lname, :string
  end
end
