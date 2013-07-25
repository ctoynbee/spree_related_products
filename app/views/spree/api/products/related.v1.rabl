object false
node(:count) { @products.count }
child(@products) do
  extends "spree/api/products/show"
end
