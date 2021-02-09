class AddColumnToCorporation < ActiveRecord::Migration[6.0]
  def change
    add_reference :corporations, :user, null: false, foreign_key: true
  end
end
