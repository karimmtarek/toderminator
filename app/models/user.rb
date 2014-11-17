class User < ActiveRecord::Base
  has_many :lists, dependent: :destroy
  # do I need to add 'has_many :todo_items' as well?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
