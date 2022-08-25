# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Board < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 30 }

  validates :description, presence: true
  validates :description, length: { minimum: 30, maximum: 140 }
  validates :description, uniqueness: true

  belongs_to :user

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
