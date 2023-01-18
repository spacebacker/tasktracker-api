class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_enum :status, %i[ open inprogress resolved closed ]

    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.text :status, enum_type: :status, default: :open, null: false
      t.belongs_to :project, null: false, foreign_key: true
      t.belongs_to :assignee, null: false, foreign_key: { to_table: :users }
      t.belongs_to :creator, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :tasks, :name
  end
end
