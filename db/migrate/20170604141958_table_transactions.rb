class TableTransactions < ActiveRecord::Migration[5.1]
  def change
  	create_table :transactions
  	add_column :transactions, :lat, :float
  	add_column :transactions, :lng, :float
  	add_column :transactions, :price, :integer
  	add_column :transactions, :area, :integer
  	add_column :transactions, :rooms, :integer
  	add_column :transactions, :date, :datetime
  end
end
