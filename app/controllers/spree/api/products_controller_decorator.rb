Spree::Api::ProductsController.class_eval do

  def related
    @product = find_product_from_params
    @products = @product.related_products
    respond_with(@products)
  end

  private

  def find_product_from_params
    if params[:id]
      find_product(params[:id])
    end
  end

end