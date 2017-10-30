class AddLecturerToCourse < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :lecturer, foreign_key: true
  end
end
