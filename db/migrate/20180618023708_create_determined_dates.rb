class CreateDeterminedDates < ActiveRecord::Migration[5.1]
  def change
    create_table :determined_dates do |t|
      t.datetime :interview_date
      t.integer  :user_id
      add_index :determined_dates, :user_id, unique: true
      t.timestamps
    end
  end
end
