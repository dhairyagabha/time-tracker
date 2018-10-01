class Workspace < ApplicationRecord
  belongs_to :user
  has_many :clients
  has_many :timers
end
