include ActionView::Helpers::NumberHelper

class ExportPdf
	include Prawn::View
	
	def initialize(quote, acc)
		@quote = quote
		@acc = acc
		text_format
		header
		content
		footer
		#stroke_axis(step_length: 25)
	end

	def content
		move_down 40
		text "Cotización para:", align: :center, size:16
		text_box "Cliente: #{@quote.client.company}", at: [100, 610]
		stroke_horizontal_line 138, 450, at: 595
		move_down 70

		#Description of Project
		text "Descripción de proyecto:", align: :center, size:16
		text_box "Quote Type: #{@quote.quote_type.humanize}", at:[100, 500]
		stroke_rectangle([70, 515], 400, 50)

		#Items Price Table Outline
		stroke_rectangle([70, 450], 400, 250)
		stroke_horizontal_line 70, 470, at: 415
		stroke_vertical_line 200, 450, at: 330

		#Items Column
		text_box "Items", at:[80, 435]

		if @quote.quote_type == "Maestria_Digital_Premium"
			items = ['Diseño elaborado', 'Tarjeta digital del Sitio Web con QR', 'Estructura de navegación avanzada', 'Optimización de motores de búsqueda (SEO)', 'Integración con links de pago ', 'Integración de Blog y redes sociales ', 'Conexión con Chat de WhatsApp', 'Cuentas de correo ilimitadas', '1 año de Dominio Gratis']
		elsif @quote.quote_type == "Maestria_Digital_Elite"
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
		text_box "#{number_to_currency(Quote.quote_types[@quote.quote_type], precision: 0)}", at:[340, 360]
		if @quote.extra_amount != 0
			text_box "Extra amount:", at:[340, 320]
			text_box "#{number_to_currency(@quote.extra_amount, precision: 0)}", at: [340, 300]
		end
		text_box "Total: #{number_to_currency(@quote.amount, precision: 0)}", at:[340, 230]
		move_cursor_to 380

		#Item Price table footer
		text_box "Esta cotización es válida para los próximos 30 días", at:[70, 190], size: 10
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
		image "app/assets/images/recunet_logo.jpg", at: [0, 750], width: 150
		text_box "Teléfono: #{@acc.phone}", at: [212, 715]
		text_box "Correo: #{@acc.email}", at: [212,700]
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
			[text: "Recunet S de R.L. de C.V.", color: "FFFFFF", size: 20],
			at: [350,20]
			)
	end

end