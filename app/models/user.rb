class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
belongs_to :team
has_many :tasks, dependent: :destroy, inverse_of: :user
accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
end
