class Quote < ApplicationRecord
	has_secure_token :invoice_number
	enum quote_type: {
    Maestria_Digital_Premium: 11999,
    Maestria_Digital_Elite: 19900
	}
	enum status: {
		Disabled: 0,
		Active: 1
	}
	belongs_to :client
	validates :quote_type, presence: true
	validates :status, presence: true
end
