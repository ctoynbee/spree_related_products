class Spree::Relation < ActiveRecord::Base
  belongs_to :relation_type
  belongs_to :relatable, :polymorphic => true
  belongs_to :related_to, :polymorphic => true

  validates :relation_type, :relatable, :related_to, :presence => true
  
  attr_accessible :related_to, :relation_type, :relatable, :related_to_id, :discount_amount, :relation_type_id, :related_to_type

  validates_uniqueness_of :relatable_id, :scope => [:related_to_id, :relation_type_id], :message => 'A Relation with those values has already been created'
end
