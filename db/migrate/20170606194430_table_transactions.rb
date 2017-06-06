class TableTransactions < ActiveRecord::Migration[5.1]
  def change
  	create_table :transactions
    add_column :transactions, :lat, :float
    add_column :transactions, :lng, :float
    add_column :transactions, :price, :integer
    add_column :transactions, :area, :integer
    add_column :transactions, :rooms, :integer
    add_column :transactions, :date, :timestamp

    # on rempli la table avec des données
    Transaction.create rooms:1, area:20, price:200100, lat:48.870808, lng:2.353689, date:Date.new(2016,01,15).to_time
    Transaction.create rooms:2, area:40, price:300000, lat:48.870808, lng:2.353689, date:Date.new(2016,03,23).to_time
    Transaction.create rooms:1, area:23, price:250000, lat:48.866660, lng:2.352403, date:Date.new(2016,06,11).to_time
    Transaction.create rooms:2, area:35, price:290000, lat:48.870808, lng:2.352403, date:Date.new(2016,02,22).to_time
    Transaction.create rooms:4, area:60, price:500000, lat:48.866312, lng:2.349088, date:Date.new(2016,03,25).to_time
    Transaction.create rooms:3, area:30, price:400000, lat:48.865892, lng:2.354558, date:Date.new(2016,01,20).to_time
    Transaction.create rooms:1, area:20, price:200000, lat:48.855360, lng:2.347162, date:Date.new(2016,01,19).to_time
  end
end
