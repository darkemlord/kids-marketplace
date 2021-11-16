class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :approval_status, :integer, default: 1
  end
end
