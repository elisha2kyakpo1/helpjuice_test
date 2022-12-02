require 'rails_helper'

RSpec.describe MySearch, type: :model do
  subject do
    described_class.new(body: 'hello world', user_id: 1)
  end

  describe 'Validations' do
    it 'The body should not be blank' do
      subject.body = nil
      expect(subject).to_not be_valid
    end

    it 'Should save when the body is not blank' do
      subject.body = 'hello world'
      expect(subject).to_be be_valid
    end
  end

  describe 'Associations' do
    it { should belongs_to(:user) }
  end
end
