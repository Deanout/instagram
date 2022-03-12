class UserController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!, only: %i[saved]
  def index; end

  def channel; end

  def saved; end

  def tagged; end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
