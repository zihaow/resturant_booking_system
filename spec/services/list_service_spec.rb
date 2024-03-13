RSpec.describe ListService do
  describe 'test ListService' do
    let!(:resturant) { create(:resturant) }
    let!(:resturant_two) { create(:resturant) }
    let!(:user) { create(:user) }
    let!(:user_two) { create(:user) }
    let!(:table) { create(:table, resturant: resturant) }
    let!(:table_two) { create(:table, resturant: resturant_two) }
    let!(:today) { Time.now.to_date }
    let!(:given_time) {
      DateTime.new(
        today.year,
        today.month,
        today.day,
        12
      )
    }
    let!(:reservation) {
      create(:reservation,
        user: user,
        resturant: resturant,
        table: table,
        duration: 1,
        start_time: given_time
      )
    }
    let!(:reservation_two) {
      create(:reservation,
        user: user_two,
        resturant: resturant_two,
        table: table_two,
        duration: 1,
        start_time: given_time
      )
    }

    subject {
      ListService.new(
        Table.select { |table| table.reserved?(given_time) },
        given_time
      ).list
    }

    it 'returns an array of reserved objects' do
      expect(subject).to be_an_instance_of(Array)
    end

    it 'returns 2 booked slots of two resturants' do
      expect(subject.size).to eql(2)
    end
  end
end
