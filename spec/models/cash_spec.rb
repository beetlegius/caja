require 'rails_helper'

RSpec.describe Cash, :type => :model do
  context '#moves' do
    it 'responds to method' do
      expect(subject).to respond_to(:moves)
    end
  end

  context 'validations' do
    it 'is invalid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end
  end
end
