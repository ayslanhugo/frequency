class Participation < ApplicationRecord
  belongs_to :event
  belongs_to :student
  belongs_to :user

  validates :student_id, uniqueness: {
    scope: :event_id,
    message: "Participante já possui presença nesta formação."
  }
end
