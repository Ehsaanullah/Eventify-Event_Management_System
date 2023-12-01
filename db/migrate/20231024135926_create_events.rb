class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :date
      t.time :time
      t.string :location
      t.integer :available_slots

      t.timestamps
    end
  end
end
