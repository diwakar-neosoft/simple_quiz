class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :exam, optional: true, class_name: 'Admin::Exam'
  has_many :exam_submissions, dependent: :destroy

  def test_assigned
    exam_id.present? ? true : false
  end
end
