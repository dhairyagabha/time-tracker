class AddTimezonToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :timezone, :string, default: 'Central Time (US & Canada)'
  end
end
