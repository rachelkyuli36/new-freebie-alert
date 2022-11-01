class EventsController < ApplicationController
  before_action :force_index_redirect, only: [:index]

  def show
    id = params[:id] # retrieve event ID from URI route
    @event = Event.find(id) # look up event by unique ID
    # will render app/views/events/show.<extension> by default
  end

  def index
    @all_freebies = Event.all_freebies
    @events = Event.with_freebies(freebies_list, sort_by)
    @freebies_to_show_hash = freebies_hash
    @sort_by = sort_by
    # remember the correct settings for next time
    session['freebies'] = freebies_list
    session['sort_by'] = @sort_by
  end

  def new
    # default: render 'new' template
  end

  def create
    @event = Event.create!(event_params)
    flash[:notice] = "#{@event.title} was successfully created."
    redirect_to events_path
  end

  def edit
    @event = Event.find params[:id]
  end

  def update
    @event = Event.find params[:id]
    @event.update_attributes!(event_params)
    flash[:notice] = "#{@event.title} was successfully updated."
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event '#{@event.title}' deleted."
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:title, :freebie, :event_date, :event_time, :affiliation)
  end

  def force_index_redirect
    if !params.key?(:freebies) || !params.key?(:sort_by)
      flash.keep
      url = events_path(sort_by: sort_by, freebies: freebies_hash)
      redirect_to url
    end
  end

  def freebies_list
    params[:freebies]&.keys || session[:freebies] || Event.all_freebies
  end

  def freebies_hash
    Hash[freebies_list.collect { |item| [item, "1"] }]
  end

  def sort_by
    params[:sort_by] || session[:sort_by] || 'id'
  end
end
