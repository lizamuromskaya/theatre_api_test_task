# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Performances', type: :request do
  let!(:performance) { create(:performance) }

  describe 'POST /performances' do
    let(:perform) { post performances_path, params: params, as: :json }

    let(:params) do
      {
        performance: {
          name: 'Performance1',
          date_range: '[2022-02-18,2022-02-24)'
        }
      }
    end

    context 'with valid params' do
      include_examples 'creates a new object', Performance, 1
      include_examples 'success response'
    end
  end

  describe 'GET /performances' do
    let!(:perform) { get performances_path }

    it 'returns all certificates' do
      expect(json.size).to eq(Performance.count)
    end

    include_examples 'success response'
  end

  describe 'DELETE /performances/:id' do
    let(:perform) { delete performance_path(performance_id) }
    let(:performance_id) { performance.id }

    context 'when request is valid' do
      include_examples 'deletes an object', Performance, -1
      include_examples 'success response'
    end
  end
end
