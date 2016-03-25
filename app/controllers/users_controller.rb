class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_users?, only: [:edit, :update, :destroy]
  layout false

  def index
    # @users = User.where("id != ?", current_user.id)
    @users = User.all
  end

  def new
    @user = User.new
    render :layout => false 
  end 

  def create
    @user = User.create user_params
    # @user = User.new(user_params)

    if @user.persisted?

    # if @user.save
      # UserMailer.user_confirmation_email(@user).deliver
      session[:user_id] = @user.id
      flash[:success] = 'Registered!'
      redirect_to login_path
    else
      flash.now[:error] = "#{@user.errors.full_messages.to_sentence}"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password) #, :password_confirmation
    end

    def hash_new_password
      unhashed_password = new_password || password
       unless unhashed_password.blank?
         self.hashed_password = BCrypt::Password.create(unhashed_password)
       end
    end

end