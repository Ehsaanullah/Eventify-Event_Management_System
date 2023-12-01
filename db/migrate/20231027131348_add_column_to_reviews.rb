class AddColumnToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :feedback, :text
  end
end
