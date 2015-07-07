class CreateAnalyzes < ActiveRecord::Migration
  def change
    create_table :analyzes do |t|
      t.string :query
      t.timestamps null: false
    end
  end
end
