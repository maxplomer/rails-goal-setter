class GoalsController < ApplicationController

  before_filter :ensure_current_user

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    @goal.complete = false
    if @goal.save
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit

  end

  def update
    @goal = Goal.find(params[:id])

    if @goal.update(complete: true)
      redirect_to user_url(current_user)
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to user_url(current_user)
    end

  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to user_url(current_user)
  end

  def index
    @goals = Goal.all
    render :index
  end

  def show

  end

  private
  def goal_params
    params.require(:goal).permit(:title, :private)
  end

end
