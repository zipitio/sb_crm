class Quote < ApplicationRecord
	belongs_to :client

	has_one_attached :logo
end
