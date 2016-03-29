class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:new, :create, :destroy]
  before_action :set_auth

  def set_auth # instance method
    @auth = session[:omniauth] if session[:oniauth]
  end

  def index # class method
    if params[:search]
      @events = Event.where(
       "lower(name) LIKE lower(?)",
       "%#{Regexp.escape(params[:search])}%"
       )
    else
      @events = future_events
      # if Kaminari will ever be needed I hope not
      # @events = Kaminari.paginate_array(future_events).page(params[:page]).per(5)
      # .paginate(:per_page => 10, :page => params[:page])
    end
  end

  def list # class method
    if params[:search]
      @events = Event.where(
       "lower(name) LIKE lower(?)",
       "%#{Regexp.escape(params[:search])}%"
       )
    else
      @events = Event.all
    end
  end

  def myevents # class method
    if params[:search]
      @events = Event.where(
       "lower(name) LIKE lower(?)",
       "%#{Regexp.escape(params[:search])}%"
       )
    else
      @events = Event.where("user_id = ?", current_user.id)
    end
  end

  def new #class methods
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
    @event.increment!(:viewcount)
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

    def set_event # 'class method'
      @event = Event.find(params[:id])
    end
    
    def event_params # 'instance method?'
      params.require(:event).permit(:name, :starts_at, :ends_at, :hero_image_url, :extended_html_description, :short_description, :published, :user_id, :category_id, :venue_id)
    end

    # http://stackoverflow.com/questions/8435385/in-rails-3-1-how-do-i-show-only-future-events      
    def future_events # 'class method'
      # Event.where('starts_at >= ?', Date.today).order(:starts_at)
      Event.where('starts_at >= ? AND published = ?', Date.today, TRUE).order(:starts_at)
      # Event.where(:starts_at >= ? AND :published => , Date.today, false).order(:starts_at)
      # syntax example "phones.area_code IN (?) AND phones.number IN (?)", area_codes, numbers)
      # :area_code => area_codes, :number => numbers
      # where(:state_id => state_id AND :approved_id => current_user.id)
    end

    def my_events
      Event.where("user_id == ?", current_user.id)
    end

    def all_events #including unpublished 'class method'
      Event.all 
    end

end