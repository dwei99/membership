class UsersController < ApplicationController
  def index

  end

  # def new
  # end

  def create
    user = User.create(first_name:params[:firstname],last_name:params[:lastname],email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation])
    if !user.errors.blank?
      puts "********"
      puts user.errors.messages
      puts "********"
      flash[:errors] = user.errors.messages
      return redirect_to '/'
    end
    if user && user.authenticate(params[:password])
      #session[:id] = user.id
      flash[:notice] = "Registration Successful"
      # Loan.create(borrower:user, amount:params[:funds].to_i)
    else
      flash.now[:errors] = 'Invalid email/password combination'
      return redirect_to '/'
    end
    redirect_to "/"
  end

  def login
    @user = User.find_by_email(params[:email])
    if !@user.errors.blank?
      flash[:errors] = @user.errors.messages
      return redirect_to '/'
    end
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
    else
      flash.now[:error] = 'Invalid email/password combination'
    end
    redirect_to "/groups"
  end

  def logout
    reset_session
    redirect_to '/'
  end
end
