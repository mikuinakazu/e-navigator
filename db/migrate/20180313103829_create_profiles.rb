class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string  :name
      t.date    :birth_date
      t.string  :sex
      t.string  :school
      t.integer :user_id

      t.timestamps
    end
  end
end
