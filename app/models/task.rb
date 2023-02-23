class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: { scope: :user_id }
  validate :validate_name_not_including_comma
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  # rubocop:disable Airbnb/OptArgParameters
  def self.ransackable_attributes(auth_object = nil)
    %w(name created_at)
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
  # rubocop:enable Airbnb/OptArgParameters

  def self.csv_attributes
    ["name", "description", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |task|
        csv << csv_attributes.map { |attr| task.send(attr) }
      end
    end
  end

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
