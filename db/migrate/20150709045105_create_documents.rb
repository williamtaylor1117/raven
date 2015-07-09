class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.json :result

      t.timestamps null: false
    end
  end
end
