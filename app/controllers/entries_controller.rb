class EntriesController < ApplicationController

    def enter
        @giveaway = Giveaway.find(params[:id])
        if @giveaway == nil
            redirect_to :not_found
        end
        @user = User.new
    end

    def new
        giveaway = Giveaway.find(params[:id])

        giveaway.users.create(params.require(:user).permit(:name, :email))

        redirect_to :enter_confirm
    end

    def confirm
    end

    def not_found
    end

end
