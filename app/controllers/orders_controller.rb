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
  end

  def create # class method
    # @order = Order.new(order_params[:user_id == @current_user.id])

    # this_ticket_type = TicketType.find(params[:ticket_type_id])
    # @order = this_ticket_type.orders.new(params[:order])   
    

    @order = Order.new(order_params) # create a new order row
    @order.user_id = current_user.id #set user_id in controller not in the view
    
    # if @order.quantity > @order.ticket_type.max_quantity
    #   errors.add_to_base("can't have more than max quantity")
    # else
      # @order.ticket_type << @order.build(params[:ticket_type])
    # end 

    respond_to do |format|
      if @order.save
        @order_ticket_types = OrderTicketType.new # create a new order_ticket_type row
        @order_ticket_types.order_id = @order.id # fill that column with a column from order row
        # @order_ticket_types.ticket_type_id = @ticket_type.id 
        @order_ticket_types.save 

        OrderMailer.order_confirmation(@order).deliver
        format.html { redirect_to @order, notice: 'Ticket order was successfully created.' }
        format.json { render :show, status: :created} #, location: @venue 
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  #   respond_to do |format|
  #     if @order.save
  #       OrderMailer.order_confirmation(@order).deliver
  #       format.html { redirect_to @order, notice: 'Ticket order was successfully created.' }
  #       format.json { render :show, status: :created} #, location: @venue 
  #     else
  #       format.html { render :new }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

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
