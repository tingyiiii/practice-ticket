class ChangeColumnToTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :corporation_id
    add_reference :tickets, :user, null: false, foreign_key: true
  end
end
