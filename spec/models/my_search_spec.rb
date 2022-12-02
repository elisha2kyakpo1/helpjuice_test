require 'rails_helper'

RSpec.describe MySearch, type: :model do
  subject do
    described_class.new(body: 'hello world', user_id: 1)
  end

  describe 'Validations' do
    it 'The body should not be blank' do
      subject.body = nil
      subject.user_id = 1
      expect(subject).to_not be_valid
    end

    it 'Should save when the body is not blank' do
      subject.body = 'hello world'
      subject.user_id = 1
      expect(subject).to be_valid
    end
  end
end
