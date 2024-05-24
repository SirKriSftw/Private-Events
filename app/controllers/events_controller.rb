class EventsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @user = current_user
        @event = @user.created_events.build(event_params)

        if @event.save
            redirect_to @event
        else
            render :new, status: :unprocessable_entity 
        end
    end


    private

    def event_params
        params.require(:event).permit(:title, :place, :date, :time)
    end
end
