RSpec.describe ReserveService do
  describe 'test ReserveService' do
    let!(:resturant) { create(:resturant) }
    let!(:user) { create(:user) }
    let!(:table) { create(:table, resturant: resturant) }
    let!(:today) { Time.now.to_date }
    let!(:given_time) {
      DateTime.new(
        today.year,
        today.month,
        today.day,
        12
      )
    }

    subject { ReserveService.new(table, given_time).available_slots }

    it 'returns an array of available slots of a table' do
      expect(subject).to be_an_instance_of(Array)
    end

    it 'returns more than one available slots of a table' do
      expect(subject.size).to be > 0
    end
  end
end
