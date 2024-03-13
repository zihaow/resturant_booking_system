require 'rails_helper'

describe TableReserve do
  describe 'TableReserve operations' do
    let!(:resturant) { create(:resturant) }
    let!(:user) { create(:user) }
    let!(:table) { create(:table, resturant: resturant) }
    let!(:today) { Time.now.to_date }
    let!(:reservation) {
      create(:reservation,
        user: user,
        resturant: resturant,
        table: table,
        duration: 1,
        start_time: DateTime.new(
          today.year,
          today.month,
          today.day,
          12
        )
      )
    }

    let(:success_payload) {
      {
        resturant: resturant.name,
        email: user.email,
        time: 17,
        duration: rand(1..2),
        party_size: rand(1..4)
      }
    }

    let(:one_hour_from_12_payload) {
      {
        resturant: resturant.name,
        email: user.email,
        time: 13,
        duration: 1,
        party_size: rand(1..4)
      }
    }

    let(:booked_payload) {
      {
        resturant: resturant.name,
        email: user.email,
        time: 12,
        duration: 1,
        party_size: rand(1..4)
      }
    }

    let(:failed_payload) {
      {
        resturant: 'Do not Exist',
        email: user.email,
        time: 17,
        duration: rand(1..2),
        party_size: rand(1..4)
      }
    }

    let(:too_many_people_payload) {
      {
        resturant: resturant.name,
        email: user.email,
        time: 17,
        duration: rand(1..2),
        party_size: 100
      }
    }

    it 'reserves a table successfully' do
      expect(described_class.call(success_payload).result).to be_truthy
    end

    it 'failed to reserves a table because it has been booked' do
      expect(described_class.call(booked_payload).result).to be_falsey
    end

    it 'reserves a table successfully when it becomes free' do
      expect(described_class.call(one_hour_from_12_payload).result).to be_truthy
    end

    it 'reserves a table unsuccessfully because resturant does not exist' do
      expect(described_class.call(failed_payload).result).to be_falsey
    end

    it 'reserves a table unsuccessfully because table cannot fit too many people' do
      expect(described_class.call(too_many_people_payload).result).to be_falsey
    end
  end
end
