class CreateOvertimeinfos < ActiveRecord::Migration[5.1]
  def change
    create_table :overtimeinfos do |t|
      t.float :overtime
      t.float :extratime
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :overtimeinfos, [:user_id, :created_at]
  end
end
