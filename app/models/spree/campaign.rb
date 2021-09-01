class Spree::Campaign < ActiveRecord::Base
  acts_as_list
  default_scope -> { order(position: :asc) }

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_and_belongs_to_many :products

  validates :title, :description, presence: true

  enum status: [:active, :inactive]

  scope :active, -> { where(status: :active).or(where.not(status: nil))}

  scope :for_web, -> {
    scp = active
    scp = scp.where('start_at IS NOT NULL AND start_at <= ?', Date.today).or(where(start_at: nil))
    scp = scp.where('end_at IS NOT NULL AND end_at >= ?', Date.today).or(where(end_at: nil))
    scp
  }

  has_attached_file :image, styles: (CAMPAIGN_IMAGE_STYLES[:image] rescue {})
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  crop_attached_file :image

  has_attached_file :mobile_image, styles: (CAMPAIGN_IMAGE_STYLES[:mobile_image] rescue {})
  validates_attachment_content_type :mobile_image, content_type: /\Aimage\/.*\z/
  crop_attached_file :mobile_image


  def self.statuses_for_select
    statuses.map do |st, idx|
      ds = I18n.t(st, scope: 'enum.spree.campaign.statuses', default: st.to_s.capitalize)
      [ds, st]
    end
  end
end
