class Progress < ApplicationRecord
  belongs_to :user

  validates :weight, :chest, :arms, :waist, :hip, :thighs, :calves,
            presence: { message: "no puede estar vacío" },
            numericality: { greater_than: 0, message: "debe ser un número mayor que 0" }
end
