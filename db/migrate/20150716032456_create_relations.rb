class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.references :document
      t.string :sentence
      t.string :subject_text
      t.timestamps null: false
    end
  end
end
