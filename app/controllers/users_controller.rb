class UsersController < ApplicationController

before_action :logged_in_user, only: [:show, :edit, :update]
before_action :correct_user, only: [:edit, :update]
	def new 
		@user = User.new
	end


  
	def show
		@user = User.find(params[:id])
    @template = Template.new
    if @user.company
    @cpostings = current_user.cpostings.where.not(starts_at: nil)
    else
    @subscriptions = current_user.subscriptions  
    end
	end
	
  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def change_desc
    @user = current_user
    @cpostings = current_user.cpostings.where.not(starts_at: nil)
    if @user.update_attribute(:description, params[:user][:description])
      flash[:success] = "Description updated!"
    else
      flash[:error] = "error"
    end
    render 'show'
  end

  def update
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :description)
    end

    def desc_param
      params.require(:user).permit(:description)
    end


    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

end