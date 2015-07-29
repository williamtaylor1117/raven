class CreateSentiments < ActiveRecord::Migration
  def change
    create_table :sentiments do |t|
      t.references :sentimentable, polymorphic: true
      t.string :sentiment_type
      t.float :sentiment_score
      t.integer :sentiment_mixed
      t.timestamps null: false
    end
  end
end
