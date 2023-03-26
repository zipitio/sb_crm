class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy pdf send_quote]
  # GET /quotes or /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1 or /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new(quote_params)
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes or /quotes.json
  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully updated." }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def pdf
    @acc = AdminCompanyContact.first
    pdf = ExportPdf.new(@quote, @acc)
    send_data pdf.render,
      filename: "#{@quote.client.company}_sb_quote.pdf",
      type: 'application/pdf',
      disposition: 'inline'
    
  end

  def send_quote
    @client = @quote.client
    UserMailer.with(quote: @quote, client: @client).send_quote.deliver_later
    flash[:notice] = "Quote sent to client via email"
    redirect_to @client
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.fetch(:quote, {}).permit(:quote_type, :amount, :client_id, :extra_amount, :status)
    end
end
