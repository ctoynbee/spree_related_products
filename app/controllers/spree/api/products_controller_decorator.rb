Spree::Api::ProductsController.class_eval do

  def related
    if params[:id]
      @product = find_product(params[:id])
    end

    @products = @product.related_products
    respond_with(@products)
  end

end