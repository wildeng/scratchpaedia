# frozen_string_literal: true

# user class for scratchpaedia
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :articles

  # The method takes name and surname to display them in a friendly mode
  # @return [String]
  def humanize
    name.capitalize + ' ' + surname.capitalize
  end
end
