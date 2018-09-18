class CreateWorkspaces < ActiveRecord::Migration[5.2]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end