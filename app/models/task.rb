class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: { scope: :user_id }
  validate :validate_name_not_including_comma
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  # rubocopを通過する書き方へ修正、Ruby2.5には非対応のためコメントアウト
  # def self.ransackable_attributes(auth_object: nil)
  #   %w(name created_at)
  # end

  # def self.ransackable_attributes(auth_object: nil)
  #   []
  # end

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
