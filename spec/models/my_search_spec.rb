require 'rails_helper'

RSpec.describe MySearch, type: :model do
  subject { MySearch.new(body: 'I am a software developer', user_id: 1) }
  before { subject.save }
  context 'validations' do
    it 'body should be present' do
      subject.body = nil
      expect(subject).to_not be_valid
    end

    it 'body should not be empty' do
      subject.body = ''
      expect(subject).to_not be_valid
    end

    it 'body should not be less than 3 characters' do
      subject.body = 'I'
      expect(subject).to_not be_valid
    end

    it 'body should not be more than 500 characters' do
      subject.body = 'I am a software developer' * 100
      expect(subject).to_not be_valid
    end

    it 'should have user id' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
  end
end
