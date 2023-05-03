# frozen_string_literal: true

class Performance < ApplicationRecord
  validates :name, presence: true
  validates_with PerformanceDateRangeValidator
end
