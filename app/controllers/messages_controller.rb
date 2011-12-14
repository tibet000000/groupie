class MessagesController < ApplicationController
  def new
    @users_to_address = "Brian.Joseff@dartmouth.edu"
    @users_from_address = User.find_by_id(params[:from]).email
    @content = params[:content]
    MessageMailer.message_me(@content, @users_to_address, @users_from_address).deliver
    redirect_to current_user, :success => "thanks for the input"
  end
end