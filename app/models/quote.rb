class Quote < ApplicationRecord
	enum quote_type: {
	Sitio_Web_Estándar: 6999, 
    Sitio_Web_Estátandar_Extra: 8498,
    Sitio_Web_Premium: 11999, 
    Sitio_Web_Elite: 19999
	}
	belongs_to :client
	validates :quote_type, presence: true
end
