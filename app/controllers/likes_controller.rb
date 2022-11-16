class LikesController < ApplicationController
    before_action :find_event
    before_action :find_like, only: [:destroy]
    def create
        if already_liked?
            flash[:notice] = "You can't like more than once"
        else
            @event.likes.create(user_id: User.find_by_id(session[:user_id]).id)
        end
        redirect_to event_path(@event)
    end
    def destroy
        if !(already_liked?)
            flash[:notice] = "Cannot unlike"
        else
            @like.destroy
        end
        redirect_to event_path(@event)
        end
    private
    def find_like
        @like = @event.likes.find(params[:id])
    end
    def find_event
        @event = Event.find(params[:event_id])
    end
    def already_liked?
        Like.where(user_id: User.find_by_id(session[:user_id]).id, event_id:
        params[:event_id]).exists?
    end
 end