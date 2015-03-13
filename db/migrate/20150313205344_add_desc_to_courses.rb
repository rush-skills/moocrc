class AddDescToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :description, :string
    add_column :courses, :instructor, :string
  end
end
