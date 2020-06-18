class TicketsController < ApplicationController

    def index
        @tickets = Ticket.all

        render json: @tickets, status: :ok
    end

    def create
        @ticket = Ticket.new
        if @ticket.save 
            render json: @ticket, status: :created
        else
            render json: @ticket.errors, status: :unprocessable_entity
        end
    end

    def update
        
        if @ticket.update_attributes(:closed => true)
            render json: @ticket, status: :ok, :message => 'ticket closed succesfully'
    end

    private

        def set_ticket
            @ticket = Ticket.find(params[:id])
        end
        
    
end
