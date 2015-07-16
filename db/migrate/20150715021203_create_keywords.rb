class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.references :keywordable, polymorphic: true
      t.string :url
      t.string :text
      t.float :relevance
      t.string :knowledge_graph_type_hierarchy
      t.timestamps null: false
    end
  end
end
