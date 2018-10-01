class Timer < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :workspace

  validates_presence_of :workspace

  scope :active, -> do
    where(stopped_at: nil)
  end
end
