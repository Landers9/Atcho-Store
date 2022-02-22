class ProductsController < ApplicationController
    def index
        @products = Product.all
        @categories = Category.all
    end
    def show
        @product = Product.find(params[:id])
        @products = Product.where(category_id: @product.category).limit(3)
    end
    def filter
        @active = Category.where(id: params[:category])[0].id
        @products = get_products(params[:category])
        @categories = Category.all
        render :index
    end
    private
    def get_products(category)
        @products = []
        if @sub_categories = Category.where(id: category)[0].categories
            @sub_categories.each do |sub_category|
                @products += get_products(sub_category)
            end
        end
        @products += Product.where(category_id: category)
        return @products
    end
end
