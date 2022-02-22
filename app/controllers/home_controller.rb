class HomeController < ApplicationController
    before_action :authenticate_user!, only: %i[ checkout checkout_final ]
    def index
        @products = Product.all.limit(3)
    end
    def about
    end
    def contact
    end
    def news
    end
    def checkout
        @carts = Cart.where(user: current_user)
    end
    def checkout_final
        @user = User.find(current_user.id)
        @user.update(user_params)
        @carts = Cart.where(user: current_user)
        @total_price = 0
        @qt_product = 0
        @carts.each do |cart|
            @total_price += cart.sum_price
            @qt_product = cart.number_product
        end
        @total_price += 1000
        @order = Order.create(total_price: @total_price, qt_product: @qt_product, user: current_user, status: "Progress")
        @carts.each do |cart|
            OrdersProduct.create(order: @order, product: cart.product)
            cart.destroy
        end
        render :paiement
    end
    def send_contact_message
        NoticeMailer.contact(params[:name], params[:email], params[:telephone], params[:subject], params[:message]).deliver
        redirect_to contact_path
    end
    def user_params
        params.require(:user).permit(:name, :email, :address, :telephone)
    end
end
