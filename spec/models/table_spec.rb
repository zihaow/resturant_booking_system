RSpec.describe Table, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:resturant) }
  end

  describe '#occupied' do
    context 'whether table is occupied' do
      let!(:resturant) { create(:resturant) }
      let!(:user) { create(:user) }
      let!(:table) { create(:table, resturant: resturant) }

      let!(:reservation) {
        create(:reservation,
          user: user, table: table, resturant: resturant,
          start_time: Time.zone.now,
          duration: 1.5
        )
      }

      subject { table.reserved?(Time.zone.now + 10.minutes)}
      it 'is occupied' do
        # be_truthy, be_falsey
        expect(subject).to be_truthy
      end
    end
  end
end
