class Section < ApplicationRecord

  has_many :section_edits
  has_many :admin_users, :through => :section_edits

  scope :visible, -> {where(:visible =>true)}
  scope :invisible, -> {where(:visible =>false)}
  scope :sorted, -> {order(:position=> :asc)}
  scope :newest_first, -> {order(:created_at=> :desc)}

  validates_presence_of :name
  validates_uniqueness_of :position
end
