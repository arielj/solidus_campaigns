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

  has_attached_file :image, styles: (CAMPAIGN_IMAGE_STYLES rescue {})
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  crop_attached_file :image

  def self.statuses_for_select
    ds = Spree.t('campaign.statuses', default: ['Active','Inactive'])
    [[ds[:active], :active], [ds[:inactive], :inactive]]
  end
end
