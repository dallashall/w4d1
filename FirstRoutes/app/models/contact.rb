# == Schema Information
#
# Table name: contacts
#
#  id      :integer          not null, primary key
#  name    :string           not null
#  user_id :integer          not null
#  email   :string           not null
#

class Contact < ActiveRecord::Base
  validates :user_id, presence: true, uniqueness: { scope: :email }
  validates :name, :email,  presence: true

  belongs_to :owner,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

    has_many :contact_shares

    has_many :shared_users, # users I share myself(contact object) with
      through: :contact_shares,
      source: :user

end
