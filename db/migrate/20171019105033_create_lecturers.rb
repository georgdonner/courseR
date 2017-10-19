class CreateLecturers < ActiveRecord::Migration[5.1]
  def change
    create_table :lecturers do |t|
      t.string :title
      t.string :name
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
