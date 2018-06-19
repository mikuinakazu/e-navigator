class CreateDeterminedDates < ActiveRecord::Migration[5.1]
  def change
    create_table :determined_dates do |t|
      t.datetime :interview_date
      t.integer  :user_id
      t.timestamps
    end
  end
end
