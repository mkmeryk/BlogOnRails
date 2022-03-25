class UsersController < ApplicationController


    def new
        @user = User.new
    end

    def create
        @user = User.new params.require(:user).permit(
            :first_name,:last_name,:email,:password,:password_confirmation
        )
        if @user.save
            session[:user_id] = @user.id
            # your application has a session for each user in which you can store small amounts of data
            # the session is only avaliable in the controller and the view
            flash.notice = "Logged in!"
            redirect_to root_path
        else
            render :new, status: 303
        end
    end


end
