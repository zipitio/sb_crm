class Quote < ApplicationRecord
	enum quote_type: {
    Maestria_Digital_Premium: 11999,
    Maestria_Digital_Elite: 19900
	}
	belongs_to :client
	validates :quote_type, presence: true
end
