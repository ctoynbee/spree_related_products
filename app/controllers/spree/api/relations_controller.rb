module Spree
  module Api
    class RelationsController < Spree::Api::BaseController

      respond_to :json

      before_filter :load_data, :only => [:create, :destroy]

      def create
        authorize! :create, Relation

        begin
          @relation = Relation.new(params[:relation])
          @relation.relatable = @product
          @relation.related_to = Spree::Product.find_by_assetbank_product_id(params[:relation][:related_to_id])
          @relation.related_to = Spree::Variant.find(@relation.related_to.id).product
          if @relation.save
            respond_with(@relation)
          else
            invalid_resource!(@relation)
          end
        rescue
          raise 'Relation not saved'
        end
      end

      def destroy_product_relations
        authorize! :delete, Relation

        if @product.present?
          @product.relations.destroy_all
        end
        respond_with(@product, :status => 204)
      end

      def show
        authorize! :read, Relation

        @relation = model_class.find_by_id(params[:id])
        respond_with(@relation)
      end

      private

      def load_data
        @product = Spree::Product.find_by_assetbank_product_id(params[:product_id])
      end

      def model_class
        Spree::Relation
      end
    end
  end
end
