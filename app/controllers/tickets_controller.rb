class TicketsController < ApplicationController
  before_action :authenticate_user!

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to root_path, notice: "已成功兌換，您的兌換券序號為 #{@ticket.num}"
    else
      render :new
    end
  end

  def show
    @tickets = current_user.tickets
  end

  private
  def ticket_params
    params.require(:ticket).permit(:num, :coporation_name, :coporation_phone, :coporation_id, :user_id)
  end
end