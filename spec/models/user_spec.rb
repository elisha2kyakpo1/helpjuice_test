require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(email: 'elisha@gmail.com',
                        password: 'dsfsfsdfsdf')
  end

  describe 'Validations' do
    it 'is not valid without a encrypted_password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is database authenticable' do
      user = User.create(
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      expect(user.valid_password?('password123')).to be_truthy
    end
  end
end
