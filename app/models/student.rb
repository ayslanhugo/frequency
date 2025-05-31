class Student < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :events, through: :participations

  def has_participation?(event_id)
    events.ids.include?(event_id)
  end
end
