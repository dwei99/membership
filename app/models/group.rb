class Group < ActiveRecord::Base

  validates :name, :presence => {message:["Group name cant be blank"]}
  validates :name, length: { minimum: 6}
  validates :name, uniqueness: true
  validates :description, :presence => {message:["Group name cant be blank"]}
  validates :description, length: { minimum: 11}
  belongs_to :user
  has_many :users, through: :members
  has_many :members, dependent: :destroy

end
