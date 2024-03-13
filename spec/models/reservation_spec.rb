# frozen_string_literal: true

RSpec.describe Reservation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:resturant) }
    it { is_expected.to belong_to(:table) }
  end
end
