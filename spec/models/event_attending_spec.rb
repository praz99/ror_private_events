require 'rails_helper'

RSpec.describe EventAttending, type: :model do
  context 'ActiveRecord Associations' do
    it { expect(described_class.reflect_on_association(:event_attendee).macro).to eq(:belongs_to) }
    it { expect(described_class.reflect_on_association(:attended_events).macro).to eq(:belongs_to) }
  end
end
