class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:new, :create, :destroy]

  def index
    if params[:search]
      @events = Event.where(
       "lower(name) LIKE lower(?)",
       "%#{Regexp.escape(params[:search])}%"
       )
    else
      # @myevents = Event.where("user_id = ?", current_user.id)
      
      # http://stackoverflow.com/questions/8435385/in-rails-3-1-how-do-i-show-only-future-events
      # @events = Event.where('starts_at >= ?', Date.today).order(:starts_at)

      @events = Kaminari.paginate_array(past_events).page(params[:page]).per(5)
               # .paginate(:per_page => 10, :page => params[:page])
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

  def edit
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end
    
    def event_params
      params.require(:event).permit(:name, :starts_at, :ends_at, :category_id, :venue_id, :hero_image_url, :extended_html_description, :short_description, :published)
    end

    def past_events
      Event.where('starts_at >= ?', Date.today).order(:starts_at) 
    end

end
