# frozen_string_literal: true

RSpec.shared_examples 'deletes an object' do |klass, count|
  it "reduces the number of #{klass.name}s by #{count}" do
    expect { perform }.to change { klass.count }.by(count)
  end
end
