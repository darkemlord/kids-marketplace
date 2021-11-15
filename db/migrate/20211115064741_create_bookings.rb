class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :approval_status
      t.date :start_date
      t.date :end_date
      t.integer :delivery_option
      t.references :user, null: false, foreign_key: true
      t.references :toy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
