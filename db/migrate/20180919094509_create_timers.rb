class CreateTimers < ActiveRecord::Migration[5.2]
  def change
    create_table :timers do |t|
      t.string :description
      t.references :project, foreign_key: true
      t.references :workspace, foreign_key: true
      t.boolean :billable
      t.datetime :started_at
      t.datetime :stopped_at

      t.timestamps
    end
  end
end
