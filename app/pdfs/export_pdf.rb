class ExportPdf
	include Prawn::View
	#before_action :set_quote, only: %i[ content ]

	def initialize(quote)
		@quote = quote
		content
	end

	def content
		font_families.update(
			'Calibri' => {
				normal: "app/assets/fonts/Calibri_Regular.ttf"
			}
		)
		font "Calibri"
		fill_color "235a7f" 

		#Header
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


		#Body
		text "Cotización para:", align: :center, size:16
		text_box "Cliente: #{@quote.client.company}", at: [100, 610]
		stroke_horizontal_line 138, 450, at: 595
		move_down 70
		text "Description of Project", align: :center, size:16
		text_box "Quote Type: #{@quote.quote_type}", at:[100, 500]
		stroke_rectangle([70, 515], 400, 50)
		stroke_rectangle([70, 450], 400, 250)
		stroke_horizontal_line 70, 470, at: 415
		stroke_vertical_line 200, 450, at: 330
		text_box "Items", at:[80, 435]
		text_box "Price", at:[340, 435]
		text_box "Total:#{@quote.amount} MXN", at:[340, 230]
		move_cursor_to 380

		0.upto(5) do |i|
			x = 90
			y = 380 - (i * 20) 
			translate(x, y) do
				fill_circle [0, 0], 2
				draw_text "Item #{i}-Translated to [#{x}, #{y}]",
				at: [5, -2]
			end
		end

		text_box "This quote is valid for the next 30 days.", at:[70, 190], size: 10

		#footer
		fill_color '235a7f'
		fill_rectangle [-50, 150], 700, 200
		formatted_text_box(
			[text: "Spacebyn", color: "FFFFFF", size: 20],
			at: [400,30]
			)

		stroke_axis(step_length: 50)


		#Snowman
		start_new_page		
		stroke_circle [250, 100], 100
		stroke_circle [250, 250], 50
		stroke_circle [250, 325], 25
		fill_circle [240, 335], 5
		fill_circle [255, 335], 5
		stroke_curve [230, 320], [260, 320], bounds: [[230, 310],[260, 310]]

	end


  	# private
    # # Use callbacks to share common setup or constraints between actions.
	# def set_quote
	#   @quote = Quote.find(params[:id])
	# end
end