class Employee < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 1, maximum: 25 }
	has_one :employment
	# validates :last_name, presence: true, length: { minimum: 1, maximum: 50 }
	# validates :phone_number, presence: true
	# validates_format_of :phone_number, with: /\d{3}-\d{3}-\d{4}/, message: "must be in the following format: xxx-xxx-xxxx"
	# validates :email, presence: true, uniqueness: { case_sensitive: true }
end
