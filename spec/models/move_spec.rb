require 'rails_helper'

RSpec.describe Move, :type => :model do
  subject(:move) { FactoryGirl.build :move }

  context '#cash' do
    it 'responds to method' do
      expect(subject).to respond_to(:cash)
    end
  end

  context 'is invalid' do
    after(:example) { expect(subject).not_to be_valid }

    it 'without an ammount' do
      subject.ammount = nil
    end

    it 'without a numerical ammount' do
      subject.ammount = SecureRandom.hex
    end

    it 'with a negative ammount' do
      subject.ammount = -1
    end

    it 'with a zero ammount' do
      subject.ammount = 0
    end

    it 'without a cash' do
      subject.cash = nil
    end

    it 'without a kind' do
      subject.kind = nil
    end

    it 'without an included kind' do
      subject.kind = SecureRandom.hex
    end
  end
end
