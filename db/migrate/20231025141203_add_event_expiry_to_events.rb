class AddEventExpiryToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :expiry_date, :date
  end
end
