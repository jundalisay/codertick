class OrdersController < ApplicationController
	before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :require_login #users must login before proceeding to orders

  def index
    @orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    @order = Order.new
    @ticket_types = TicketType.all
  end

  def create
    byebug
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Ticket order was successfully created.' }
        format.json { render :show, status: :created} #, location: @venue 
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Ticket order was successfully updated.' }
        format.json { render :show, status: :ok} #, location: @order 
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to event_tickets_path, notice: 'Ticket order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:user_id, :ticket_type_id, :price, :quantity)
    end

end
