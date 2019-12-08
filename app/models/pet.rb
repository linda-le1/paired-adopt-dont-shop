class Pet < ApplicationRecord
  belongs_to :shelter

  has_many :pet_applications
  has_many :applications, through: :pet_applications

  validates_presence_of :image_url, message: "must be entered."
  validates_presence_of :description, message: "must be entered."
  validates :shelter, presence: true
  validates_presence_of :name, format: { with: /\A[a-zA-Z ]+\z/, message: "%{attribute} must only contain letters."}
  validates_presence_of :approximate_age, numericality: { message: "%{attribute} must be a number." }
  validates_inclusion_of :sex, {in: %w( m f M F), message: "is required and must be entered as either F or M."}
  before_save :upcase_field

  def upcase_field
    sex.upcase
  end

  def update_status
    is_adoptable = false
  end


end
