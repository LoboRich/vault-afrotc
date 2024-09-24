class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { ceo: 'ceo', admin: 'admin', sales: 'sales', cashier: 'cashier',  'credit_and_collection': 'credit_and_collection', 'water_reader': 'water_reader' }
end
