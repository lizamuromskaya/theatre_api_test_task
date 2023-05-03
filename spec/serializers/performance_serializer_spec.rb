# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PerformanceSerializer, type: :serializer do
  let(:subject) { JSON.parse(serialization.to_json) }

  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }
  let(:serializer) { described_class.new(performance) }

  let(:performance) { create(:performance) }

  let(:expected_json) do
    {
      id: performance.id,
      name: performance.name,
      time: '19.00',
      start_date: performance.date_range.first,
      end_date: performance.date_range.last - 1
    }.as_json
  end

  it 'creates special JSON for the API' do
    is_expected.to eq(expected_json)
  end
end
