class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: { scope: :user_id }
  validate :validate_name_not_including_comma
  belongs_to :user
  has_one_attached :image

  scope :recent, -> { order(created_at: :desc) }

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
