class Progress < ApplicationRecord
  belongs_to :user

  validates :weight, :chest, :arms, :waist, :hip, :thighs, :calves,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 150,
              message: "debe ser un número entre 0 y 150"
            }

  validates :user_id, presence: true
end
