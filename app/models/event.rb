class Event < ApplicationRecord
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :students, through: :participations
end
