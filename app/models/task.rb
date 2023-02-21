class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: { scope: :user_id }
  validate :validate_name_not_including_comma
  belongs_to :user
  has_one_attached :image

  scope :recent, -> { order(created_at: :desc) }

  # rubocop:disable Airbnb/OptArgParameters
  def self.ransackable_attributes(auth_object = nil)
    %w(name created_at)
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
  # rubocop:enable Airbnb/OptArgParameters

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
