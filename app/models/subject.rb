class Subject < ApplicationRecord
  has_many :courses
  has_many :lecturers, through: :courses
end
