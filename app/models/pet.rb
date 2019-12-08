class Pet < ApplicationRecord
  belongs_to :shelter

  has_many :pet_applications
  has_many :applications, through: :pet_applications

  validates :shelter, presence: true
  validates_presence_of :image_url
  validates :name, presence: true, format: { with: /\A[a-zA-Z ]+\z/, message: "is required and must only contain letters"}
  validates :description, presence: true
  validates :sex, presence: true
  validates_inclusion_of :sex, in: %w( m f M F)
  validates :approximate_age, presence: true, numericality: { only_integer: true, message: "must be a number"}
  before_save :upcase_field

  def upcase_field
    sex.upcase
  end

  def update_status
    is_adoptable = false
  end


end
