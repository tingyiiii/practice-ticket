class AddColumnToTicket < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :coporation_name, :string
    add_column :tickets, :coporation_id, :string
    add_column :tickets, :coporation_phone, :string
  end
end
