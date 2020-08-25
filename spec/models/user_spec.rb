require 'rails_helper'

RSpec.describe User, type: :model do
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
