# frozen_string_literal: true

RSpec.shared_examples 'creates a new object' do |klass, count = 1|
  it "increments the number of #{klass.name}s by #{count}" do
    expect { perform }.to change { klass.count }.by(count)
  end
end
