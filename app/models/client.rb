class Client < ApplicationRecord
	enum status: {
		prospect: 10,
		client: 20,
		renew: 30,
		cancelled: 40,
		vip: 50
	}
	belongs_to :user
	has_many :quotes
	validates :first_name, presence: true, length: {minimum: 3, maximum: 100}
	validates :last_name, presence: true, length: {minimum: 3, maximum: 100}
	validates :company, presence: true, length: {minimum: 1, maximum: 100}
end