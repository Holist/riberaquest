class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_badges

  has_many :ongoing_badges, -> { where(completed: false) }, :class_name => 'UserBadge'
  has_many :completed_badges, -> { where(completed: true) }, :class_name => 'UserBadge'

  has_many :user_objectives, through: :user_badges
  after_create :add_badges

  def has_done_this?(objective)
    user_objectives.where(objective: objective).any?
  end

  def add_badges
    Badge.all.each do |badge|
      UserBadge.create!(user: self, badge: badge)
    end
  end

end
