require 'rails_helper'

RSpec.describe Article, type: :model do
  subject do
    described_class.new(title: 'hello world', content: 'hello world content')
  end

  describe 'Validations' do
    it 'The title should not be blank' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Should save when the body is not blank' do
      subject.title = 'I have a title'
      expect(subject).to_be be_valid
    end

    it 'The content should not be blank' do
      subject.content = nil
      expect(subject).to_not be_valid
    end

    it 'Should save when the content is not blank' do
      subject.content = 'I have a content'
      expect(subject).to_be be_valid
    end
  end
end
