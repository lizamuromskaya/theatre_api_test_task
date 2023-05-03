# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Performance, type: :model do
  describe 'validations' do
    subject { build(:performance) }

    it { should validate_presence_of(:name) }
  end
end
