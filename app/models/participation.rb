class Participation < ApplicationRecord
  belongs_to :event
  belongs_to :student
  belongs_to :user
end
