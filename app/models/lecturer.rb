class Lecturer < ApplicationRecord
  has_many :subjects
  has_many :courses, through: :subjects
end
