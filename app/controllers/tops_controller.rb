class TopsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @top = Top.new

    # Check the games done by the user, to be updated for each top 2 then 3, then 4, then 5, or add validations
    @play_array = @user.participations.map(&:play_id)
    @game_array = @play_array.map { |play_id| Play.find(play_id).game_id }.uniq
    @games = Game.all.select { |g| @game_array.include?(g.id) }
  end

  def create
    @top = Top.new(top_params)
    @top.user = current_user
    if @top.save
      redirect_to user_path(@top.user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @top = Top.find(params[:id])

    # Check the games done by the user, to be updated for each top 2 then 3, then 4, then 5
    @play_array = @user.participations.map(&:play_id)
    @game_array = @play_array.map { |play_id| Play.find(play_id).game_id }.uniq
    @games = Game.all.select { |g| @game_array.include?(g.id) }
  end

  def update
    @top = Top.find(params[:id])
    @user = @top.user
    if @top.update(top_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @top = Top.find(params[:id])
    @user = @top.user
    @top.delete
    redirect_to user_path(@user)
  end

  private

  def top_params
    params.require(:top).permit(:one_id, :one_comment, :two_id, :two_comment, :three_id, :three_comment, :four_id, :four_comment, :five_id, :five_comment)
  end
end
