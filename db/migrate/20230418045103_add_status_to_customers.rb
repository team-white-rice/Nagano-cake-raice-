class AddStatusToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :status, :boolean,  null: false, default: true
  end
end
