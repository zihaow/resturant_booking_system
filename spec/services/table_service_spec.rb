RSpec.describe TableService do
  describe 'test TableService' do
    let!(:resturant) { create(:resturant) }

    subject {
      TableService.new(
        resturant.from,
        resturant.to,
        resturant.max_allow_duration
      ).slots
    }

    it 'returns an array of time slots' do
      expect(subject).to be_an_instance_of(Array)
    end

    it 'returns all possible time slots for tables of a resturant' do
      expect(subject.size).to be > 0
    end
  end
end
