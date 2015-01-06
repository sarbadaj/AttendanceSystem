class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :timetracks
  accepts_nested_attributes_for :company

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :invitable
end
