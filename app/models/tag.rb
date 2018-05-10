class Tag < ApplicationRecord
  belongs_to :category, dependent: :destroy
  has_many :tips, :through => :tip_tags
end
