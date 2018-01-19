class Annoucement < ApplicationRecord
  has_many :pictures
  accepts_nested_attributes_for :pictures, allow_destroy: true

  scope :newest_annoucement, -> {
    limit(1).order("created_at desc")
  }
end
