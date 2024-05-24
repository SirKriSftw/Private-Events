class UsersController < ApplicationController
    def show
        @Events = User.created_events
    end
end
