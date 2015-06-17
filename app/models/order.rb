class Order < ActiveRecord::Base
  enum status: [:opened, :submitted]

  belongs_to :user
  belongs_to :building
  has_many :items, dependent: :destroy

  validates :user, presence: true
  validates :status, presence: true, inclusion: { in: Order.statuses.keys }
  validates :number, uniqueness: true, allow_nil: true
  validates :number, presence: true, unless: -> (order) { order.new_record? || order.opened? }
  validates_uniqueness_of :status, scope: [:user_id], if: -> (order) { order.opened? }
  validates :total_amount, numericality: { greater_than_or_equal_to: 0 }

  scope :by_user, -> (user_id) { where(user_id: user_id) }
  scope :with_items, -> { includes(:items) }
end
