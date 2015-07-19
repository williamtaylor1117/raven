class CreateSentiments < ActiveRecord::Migration
  def change
    create_table :sentiments do |t|
      t.references :sentimentable, polymorphic: true
      t.string :type
      t.float :score
      t.integer :mixed
      t.timestamps null: false
    end
  end
end
