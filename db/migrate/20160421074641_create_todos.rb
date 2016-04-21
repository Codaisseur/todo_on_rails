class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :completed, default: false, null: false

      t.timestamps null: false
    end
  end
end
