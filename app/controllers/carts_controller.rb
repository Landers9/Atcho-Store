class CartsController < ApplicationController
    before_action :authenticate_user!
    def create
        @cart = Cart.new(product_id: params[:product_id], user_id: current_user.id)
        @cart.update(sum_price: Product.find(params[:product_id]).price)
        if @cart.save
            flash[:notice] = "Le produit a été ajouté au panier"
        else
            flash[:alert] = "Le produit existait dans votre panier"
        end
        @products = Product.all
        @categories = Category.all
        render 'products/index'
    end
    def index
        @carts = Cart.where(user: current_user).order(created_at: :desc)
        flash[:notice] = false
        flash[:alert] = false
    end
    def update
        @cart = Cart.find(params[:id])
        if @cart.update(number_product: cart_params[:number_product], sum_price: (@cart.product.price*cart_params[:number_product].to_i))
          redirect_to carts_path
        else
          flash[:alert] = "Mise à jour échouée"
          redirect_to carts_path
        end
    end
    def destroy
        @cart = Cart.find(params[:id])
        if @cart.destroy
            flash[:notice] = 'Le produit a été retiré du panier'
            redirect_to carts_path
        else
            flash[:alert] = 'Suppression échouée'
            redirect_to carts_path
        end
    end

    private

    def cart_params
        params.require(:cart).permit(:number_product)
    end

end
