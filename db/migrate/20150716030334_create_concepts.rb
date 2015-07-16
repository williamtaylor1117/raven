class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.string :text
      t.float :relevance
      t.string :knowledge_graph_type_hierarchy
      t.timestamps null: false
    end
  end
end
