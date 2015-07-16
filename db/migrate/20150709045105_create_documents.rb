class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.json :result
      t.string :url
      t.string :title
      t.string :image
      t.string :author

      t.timestamps null: false
    end
  end
end
