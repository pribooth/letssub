class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.integer :user_id
      t.string :city
      t.date :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
