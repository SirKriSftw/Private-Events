class EventsController < ApplicationController

    def index
        @events = Event.all
    end

    def create
        @event = 
    end


    private

    def event_params
        params.require(:event).permit(:title, :place, :date, :time)
    end
end
