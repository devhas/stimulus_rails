class Employee < ApplicationRecord
	has_many :employments
  validates :first_name, presence: true, length: { minimum: 1, maximum: 25 }
	validates :last_name, presence: true, length: { minimum: 1, maximum: 50 }
	validates :phone_number, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: true }
	validates_format_of :phone_number, with: /\d{3}-\d{3}-\d{4}/, message: "must be in the following format: xxx-xxx-xxxx"
end
