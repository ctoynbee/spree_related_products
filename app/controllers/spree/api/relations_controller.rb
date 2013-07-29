module Spree
  module Api
    class RelationsController < Spree::Api::BaseController

      before_filter :load_data, :only => [:create, :destroy]

      def create
        @relation = Relation.new(params[:relation])
        @relation.relatable = @product
        @relation.related_to = Spree::Variant.find(params[:relation][:related_to_id]).product
        @relation.save
        respond_with(@relation)
      end


      def destroy_product_relations
        if @product.present?
          @product.relations.destroy_all
        end
        respond_with(@product, :status => 204)
      end

      def by_product
        if @product.present?
          respond_with(@product.related_products)
        end
      end

      private

      def load_data
        @product = Spree::Product.find_by_id(params[:product_id])
      end

      def model_class
        Spree::Relation
      end
    end
  end
end
