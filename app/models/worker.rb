class Worker < ApplicationRecord
  belongs_to :order, optional: true
  validates_associated :order
  validate :validate_workers_limit #Custom validation for workers

  private

  def validate_workers_limit
    if order.present? && order.workers.size >= 5
      errors.add(:base, "A max of 5 workers can work on one order!")
    end
  end
end
