class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @events = Event.where(
       "lower(name) LIKE lower(?)",
       "%#{Regexp.escape(params[:search])}%"
       )
    else
      @myevents = Event.where("user_id == ?", current_user.id)
      @events = Event.all
    end
  end

  def new
    @event = Event.new
    @venues = Venue.all
    @categories = Category.all
    # @event.venues.build(event_params)
  end

  def create
    @venues = Venue.all
    @category = Category.all
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path, notice: 'Event was successfully created.'
    else
      flash.now[:error] = "#{@event.errors.full_messages.to_sentence}"
      render action: 'new'
    end
    # @event = current_user.event.build(event_params)
    # if @event.save
    #   redirect_to @event, notice: 'Event was successfully created.'
    # else
    #   render action: 'new'
    # end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end
    
    def event_params
      params.require(:event).permit(:name, :starts_at, :ends_at, :category_id, :venue_id, :hero_image_url, :extended_html_description)
    end

end
