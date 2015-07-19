class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :relation
      t.string :text
      t.string :lemmatized
      t.string :verb_text
      t.string :verb_tense
      t.timestamps null: false
    end
  end
end
