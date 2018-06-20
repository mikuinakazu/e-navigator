class AddUniqueToDeterminedDate < ActiveRecord::Migration[5.1]
  def change
    add_index :determined_dates, :user_id, unique: true
  end
end
