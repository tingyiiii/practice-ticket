class DropTableCorporation < ActiveRecord::Migration[6.0]
  def change
    drop_table :corporations
  end
end
