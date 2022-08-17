class Employment < ApplicationRecord
  belongs_to :employee
  validates :employer, presence: true, length: { minimum: 1, maximum: 25 }
end
