class Reservist < ApplicationRecord

  belongs_to :user, optional: true
  has_many :adts, class_name: "Adt", foreign_key: "reservist_id", dependent: :destroy

  enum role: { user: 0, admin: 1 }
  after_create :create_user_account
  def full_name
    "#{last_name}, #{first_name} #{middle_name}"
  end

  def create_user_account
    user = User.create(
      email: "#{email}",
      password: "password",
      password_confirmation: "password"
    )

    update(user: user)
  end
end
