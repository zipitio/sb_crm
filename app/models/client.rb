class Client < ApplicationRecord

	validates :first_name, presence: true, length: {minimum: 3, maximum: 100}
	validates :last_name, presence: true, length: {minimum: 3, maximum: 100}
	validates :company, presence: true, length: {minimum: 1, maximum: 100}
end