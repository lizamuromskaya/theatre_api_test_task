# frozen_string_literal: true

class PerformanceDateRangeValidator < ActiveModel::Validator
  def validate(record)
    return if date_range_valid?(record) && date_range_free?(record)

    raise ActionController::BadRequest.new, 'Date Range is not correct'
  end

  def date_range_free?(record)
    Performance.all.each do |p|
      return false unless date_before_all_performances?(record, p) || date_after_all_performances?(record, p)
    end
  end

  def date_before_all_performances?(record, performance)
    (record[:date_range].first < performance.date_range.first) &&
      (performance.date_range.first >= record[:date_range].last)
  end

  def date_after_all_performances?(record, performance)
    performance.date_range.last <= record[:date_range].first
  end

  def date_range_valid?(record)
    record[:date_range].first < record[:date_range].last
  end
end
