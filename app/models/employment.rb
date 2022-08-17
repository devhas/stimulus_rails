class Employment < ApplicationRecord
  belongs_to :employee
  validates :employer, presence: true, length: { minimum: 1, maximum: 25 }
  validates :date_started, presence: true
  validates :date_employment_ended, presence: true
end
