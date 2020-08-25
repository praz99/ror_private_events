require 'rails_helper'

RSpec.describe User, type: :model do
  context 'ActiveModel Validations' do
    subject {
      described_class.new(
        name: 'Prazwal',
        username: 'praz'
      )
    }
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with name less than 3 characters' do
      subject.name = 'pr'
      expect(subject).to_not be_valid
    end

    it 'is not valid without username' do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with username less than 3 characters' do
      subject.username = 'pr'
      expect(subject).to_not be_valid
    end
  end

  context 'ActiveRecord Associations' do
    it { expect(described_class.reflect_on_association(:event_attendings).macro).to eq(:has_many) }
    it { expect(described_class.reflect_on_association(:attended_events).macro).to eq(:has_many) }
  end
end
