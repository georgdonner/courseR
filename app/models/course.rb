class Course < ApplicationRecord
  belongs_to :lecturer
  belongs_to :subject
  has_many :ratings
end
