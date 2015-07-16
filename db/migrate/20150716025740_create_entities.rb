class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.references :entityable, polymorphic: true
      t.string :type
      t.float :relevance
      t.string :knowledge_graph_type_hierarchy
      t.integer :count
      t.string :text
      t.string :disambiguated_name
      t.string :disambiguated_geo

      t.timestamps null: false
    end
  end
end
