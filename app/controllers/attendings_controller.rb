class AttendingsController < ApplicationController
    before_action :authenticate_user!

    def new
        @attending = Attending.new
    end

    def create
        @user = current_user
        @event = Event.find(params[:format])
        @attending = Attending.new(attended_event_id: @event.id, event_attendee_id: @user.id)

        if @attending.save
            redirect_to @event
        else
            render :new, status:  :unprocessable_entity 
        end
    end

    def destroy
        @user = current_user
        @event = Event.find(params[:id])
        @attending = Attending.find_by(attended_event_id: @event.id, event_attendee_id: @user.id)
        if @attending.destroy
            redirect_to @event
        end
    end
end
