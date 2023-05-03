# frozen_string_literal: true

class PerformanceSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :start_date,
             :end_date,
             :time

  def time
    '19.00'
  end

  def start_date
    object.date_range.first
  end

  # return the day with last performance
  def end_date
    object.date_range.last - 1.day
  end
end
