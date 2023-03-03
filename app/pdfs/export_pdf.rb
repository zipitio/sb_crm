class ExportPdf
	include Prawn::View
	#before_action :set_quote, only: %i[ content ]

	def initialize(quote)
		@quote = quote
		text_format
		header
		content
		footer
		stroke_axis(step_length: 25)
	end

	def content
		text "Cotización para:", align: :center, size:16
		text_box "Cliente: #{@quote.client.company}", at: [100, 610]
		stroke_horizontal_line 138, 450, at: 595
		move_down 70

		#Description of Prokect
		text "Description of Project", align: :center, size:16
		text_box "Quote Type: #{@quote.quote_type.humanize}", at:[100, 500]
		stroke_rectangle([70, 515], 400, 50)

		#Items Price Table Outline
		stroke_rectangle([70, 450], 400, 250)
		stroke_horizontal_line 70, 470, at: 415
		stroke_vertical_line 200, 450, at: 330

		#Items Column
		text_box "Items", at:[80, 435]

		if @quote.quote_type == "Sitio_Web_Estándar"
			items = ['Diseño profesional', 'Páginas informativas', 'Integración con redes sociales', 'Optimización de motores de búsqueda', 'Certificado SSL', 'Hosting y subdominio']
		elsif @quote.quote_type == "Sitio_Web_Estándar_Extra"
			items = ['Diseño profesional', 'Páginas informativas', 'Integración con redes sociales', 'Optimización de motores de búsqueda', 'Certificado SSL', 'Hosting y subdominio personalizado', 'Cuentas de correo ilimitadas', 'Integración del dominio a la página']
		elsif @quote.quote_type == "Sitio_Web_Premium"
			items = ['Diseño elaborado', 'Tarjeta digital del Sitio Web con QR', 'Estructura de navegación avanzada', 'Optimización de motores de búsqueda (SEO)', 'Integración con links de pago ', 'Integración de Blog y redes sociales ', 'Conexión con Chat de WhatsApp', 'Cuentas de correo ilimitadas', '1 año de Dominio Gratis']
		elsif @quote.quote_type == "Sitio_Web_Elite"
			items = ['Diseño exclusivo', 'Tarjeta digital del Sitio Web con QR', 'Integración - herramientas de análisis de datos', 'Optimización de motores de búsqueda (SEO)', 'Integración de tienda en línea y links de pago ', 'Integración de herramientas de seguridad', 'Conexión con Chat de WhatsApp', 'Cuentas de correo ilimitadas', '1 año de Dominio Gratis']
		end

		items.each do |item|
			x = 90
			y = 380 - (items.find_index(item) * 20)
			translate(x, y) do
				fill_circle [0,0], 2
				draw_text "#{item}",
				at: [5, -2]
			end
		end

		#Price Column
		text_box "Price", at:[340, 435]
		text_box "Package amount:", at:[340,380]
		text_box "#{Quote.quote_types[@quote.quote_type]} MXN", at:[340, 360]
		if @quote.extra_amount != 0
			text_box "Extra amount:", at:[340, 320]
			text_box "#{@quote.extra_amount} MXN", at: [340, 300]
		end
		text_box "Total: #{@quote.amount} MXN", at:[340, 230]
		move_cursor_to 380

		#Item Price table footer
		text_box "This quote is valid for the next 30 days.", at:[70, 190], size: 10
	end

	def text_format
		font_families.update(
			'Calibri' => {
				normal: "app/assets/fonts/Calibri_Regular.ttf"
			}
		)
		font "Calibri"
		fill_color "235a7f"
	end

	def header
		text "Spacebyn", size: 30
		text_box "55 30 42 12 27", at: [250, 715]
		text_box "contacto@spacebyn.com", at: [196,700]
		fill_rectangle [350, 760], 300, 100
		formatted_text_box(
			[text: "Cotización", color: "FFFFFF", size: 20],
			at: [400,720]
			)
		formatted_text_box(
			[text: "#{@quote.created_at.to_date}", color: "FFFFFF", size: 20],
			at: [400,700]
			)
		move_down 50
	end

	def footer
		fill_color '235a7f'
		fill_rectangle [-50, 150], 700, 200
		formatted_text_box(
			[text: "Spacebyn", color: "FFFFFF", size: 20],
			at: [400,30]
			)
	end

end