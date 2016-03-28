class OrdersController < ApplicationController
	before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :require_login #users must login before proceeding to orders

  def index # class method
    @orders = Order.all
  end

  def show # class method
  	@order = Order.find(params[:id])
  end

  def new # class method
    @event = Event.find(params[:event_id])
    @order = Order.new
    @ticket_types = TicketType.all
  end

  def create # class method
    # @order = Order.new(order_params[:user_id == @current_user.id])
    @order = Order.new(order_params)
    @order.user_id = current_user.id #set user_id in controller not in the view

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

  def update # instance method
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

  def destroy # instance method
    @order.destroy
    respond_to do |format|
      format.html { redirect_to event_tickets_path, notice: 'Ticket order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_order # class method
      @order = Order.find(params[:id])
    end

    def order_params #instance method?
      params.require(:order).permit(:user_id, :ticket_type_id, :price, :quantity)
    end

end
