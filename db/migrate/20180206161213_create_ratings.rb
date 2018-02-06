class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.float :praxis
      t.float :difficulty
      t.float :homework
      t.belongs_to :course

      t.timestamps
    end
  end
end
