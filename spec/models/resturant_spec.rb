RSpec.describe Resturant, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:tables) }
  end
end
