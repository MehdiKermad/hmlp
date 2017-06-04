class TableQueries < ActiveRecord::Migration[5.1]
  def change
  	create_table :queries
  	add_column :queries, :email, :string
  	add_column :queries, :lat, :float
  	add_column :queries, :lng, :float
  	add_column :queries, :result_count, :integer
  end
end
