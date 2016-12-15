class StoreController < ApplicationController
  	
  	def shoe_store
  		@user = current_user
		@shoes = Shoe.all
  		render 'shoe_store'
    end

  	def dashboard
  		@user = current_user
  		@my_shoes = current_user.shoes
  		@purchases = current_user.sales
  		render 'dashboard'
    end

    def add_shoe
    	new_shoe = current_user.shoes.new(receive_shoe)
    	if new_shoe.valid?
    		new_shoe.save
    	else
    		flash[:errors] = new_shoe.errors.full_messages
    	end
    	redirect_to :back
    end

    def remove_shoe
    	Shoe.find(params[:id]).destroy
    	redirect_to :back
    end

    def buy_shoe
    	sale = Sale.new(shoe_id: params[:id], user_id:session[:user_id])
    	sale.save
    	redirect_to "/dashboard/#{session[:user_id]}"
    end


    private

    def receive_shoe
    	params.require(:add_product).permit(:product, :price) 
    end
end
