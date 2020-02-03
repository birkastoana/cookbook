class Recipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|

      t.timestamps
      t.column :title, :string, :limit => 32, :null => false
      t.column :instructions, :string, :limit => 3000, :null => true
    end
  end
end
