class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.string :sentence
      t.string :subject
      t.timestamps null: false
    end
  end
end
