class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string  :name
      t.date    :birth_date
      t.integer :sex, default: 0, null: false, limit: 1
      t.string  :school
      t.integer :user_id

      t.timestamps
    end
  end
end
