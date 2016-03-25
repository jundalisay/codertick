class TicketTypesController < ApplicationController
  before_action :set_ticket_type, only: [:show, :edit, :update, :destroy]

  def index
    @ticket_types = TicketType.all
  end

  def show
    
  end

  def new
    @ticket_type = TicketType.new
  end

  def edit
  end

  def create
    @ticket_type = TicketType.new(ticket_type_params)

    respond_to do |format|
      if @ticket_type.save
        format.html { redirect_to @ticket_type, notice: 'Ticket type was successfully created.' }
        format.json { render :show, status: :created, location: @ticket_type }
      else
        format.html { render :new }
        format.json { render json: @ticket_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ticket_type.update(ticket_type_params)
        format.html { redirect_to @ticket_type, notice: 'Ticket type was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket_type }
      else
        format.html { render :edit }
        format.json { render json: @ticket_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket_type.destroy
    respond_to do |format|
      format.html { redirect_to ticket_types_url, notice: 'Ticket type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_ticket_type
      @ticket_type = TicketType.find(params[:id])
    end

    def ticket_type_params
      params.require(:ticket_type).permit(:event, :price, :name, :max_quantity)
    end
end