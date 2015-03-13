class CreateDeadlines < ActiveRecord::Migration
  def change
    create_table :deadlines do |t|
      t.string :title
      t.boolean :completed
      t.references :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :deadlines, :courses
  end
end
