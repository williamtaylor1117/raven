class CreateRelationObjects < ActiveRecord::Migration
  def change
    create_table :relation_objects do |t|
      t.references :relation
      t.string :text
      t.float :relevance
      t.string :knowledge_graph_type_hierarchy
      t.timestamps null: false
    end
  end
end
