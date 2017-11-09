class AddSemesterInfoToSubject < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :semester_info, :string
  end
end
