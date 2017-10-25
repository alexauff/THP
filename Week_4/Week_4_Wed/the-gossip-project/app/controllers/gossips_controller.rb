class GossipsController < ApplicationController

	def new
		@gossip = Gossip.new
	end

	def create
		@gossip = Gossip.new(gossip_params)
  	 	@gossip.save
  		redirect_to @gossip
	end

	def index
		@gossips = Gossip.all
	end

	def edit
		@gossip = Gossip.find(params[:id])
	end

	def update
		@gossip = Gossip.find(params[:id])
    	@gossip.anonymoous_author = gossip_params[:anonymoous_author]
    	@gossip.content = gossip_params[:content]
    		if @gossip.update(gossip_params)
      		redirect_to @gossip
    		else
      		render 'Modifier'
    end
	end

	def show
		@gossip = Gossip.find(params[:id])
	end

	def destroy
		@gossip = Gossip.find(params[:id])
		@gossip.destroy
		redirect_to gossips_path
	end

private
	def gossip_params
		params[:gossip].permit(:anonymoous_author, :content)
	end


end
