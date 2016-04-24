class UsersController < ApplicationController
  before_action :set_users, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  #GET /users/:id
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/:id/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Simple App"
      redirect_to @user
    else
      render 'new'
    end
  end

  # PUT /users/:id
  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DESTROY /users/:id
  def destroy
    @user.destroy
    redirect_to users.path
  end

  private
    # User callbacks share common setup or constraints between action
    def set_users
      @user = User.find(params[:id])   
    end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end
end
