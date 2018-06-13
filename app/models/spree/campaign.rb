class Spree::Campaign < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_and_belongs_to_many :products

  validates :title, :description, presence: true

  enum status: [:active, :inactive]

  scope :active, -> { where(status: :active).or(where.not(status: nil))}

  scope :for_web, -> {
    scp = active
    scp = scp.where('start_at IS NOT NULL AND start_at >= ?', Date.today).or(where(start_at: nil))
    scp = scp.where('end_at IS NOT NULL AND end_at <= ?', Date.today).or(where(end_at: nil))
    scp
  }

  def self.statuses_for_select
    ds = I18n.t('campaign.statuses', default: [['Active','Inactive']])
    [[ds[0], :active], [ds[1], :inactive]]
  end
end
