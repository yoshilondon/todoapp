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
  validates :name, format: { with: /\A(?!\@)/ }

  validates :description, presence: true
  validates :description, length: { minimum: 1, maximum: 140 }
  validates :description, uniqueness: true

  validate :validate_name_and_description_length

  belongs_to :user

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  private
  def validate_name_and_description_length
    char_count = self.name.length + self.description.length
    errors.add(:content, 'more than 3 letters' ) unless char_count > 3
  end
end
