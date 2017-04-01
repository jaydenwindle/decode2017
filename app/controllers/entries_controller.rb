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
        @user = User.find_by(email: params[:user][:name])
        if !@user
            @user = User.create(:email => params[:user][:email]) do |u|
                u.name = params[:user][:name]
            end
            @user.save
        end

        giveaway.user << @user
        redirect_to :enter_confirm
        
    end

    def confirm
    end

    def not_found
    end

end
