# frozen_string_literal: true

require 'rails_helper'

describe PerformanceDateRangeValidator do
  subject { performance }

  let!(:performance) { build(:performance, name: 'Performance1', date_range: ((Date.today - 10)..Date.today)) }

  context 'when performances for this date does not exist' do
    it 'is valid' do
      expect(subject.errors[:base]).not_to include 'Date Range is not correct'
    end
  end

  context 'when performances for this date exists' do
    let!(:existing_performance) do
      performance = build(:performance,
                          name: 'Performance10',
                          date_range: ((Date.today - 5)..Date.today))
      performance.save(validate: false)
    end

    it 'is not valid' do
      expect { subject.validate }.to raise_error(ActionController::BadRequest)
    end
  end
end
