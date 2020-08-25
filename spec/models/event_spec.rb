require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'ActiveModel Validations' do
    subject {
      described_class.new(
        title: 'Hello',
        description: 'World',
        events_date: DateTime.now + 1.week,
        creator: User.new
      )
    }

    it 'is valid with valid attirbutes' do
      expect(subject).to be_valid
    end

    it 'is not valid without events_date' do
      subject.events_date = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end
  end

  context 'ActiveRecord Associations' do
    it { expect(described_class.reflect_on_association(:event_attendings).macro).to eq(:has_many) }
    it { expect(described_class.reflect_on_association(:attendees).macro).to eq(:has_many) }
  end
end
