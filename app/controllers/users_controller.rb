class UsersController < ApplicationController

    # Create the new user
    # /users/create?email=myemail@dhyew.com&name=HeyThere
    def create
        user = User.find_by(params[:email])
        if user.nil?
            user = User.new(params)
        end
        if user.save

        end
    end

end
