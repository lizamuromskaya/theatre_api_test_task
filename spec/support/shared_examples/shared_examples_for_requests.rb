# frozen_string_literal: true

RSpec.shared_examples 'success response' do
  it 'returns successful response' do
    perform
    expect(response).to have_http_status(:success)
  end
end
