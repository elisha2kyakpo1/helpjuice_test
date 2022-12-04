RSpec.describe Searches, type: :service do
  let(:user) { User.create(email: 'elisha@gmail,com',password: '123456e', id: 1) }

  subject {
    described_class.new('Anything', user.id)
  }

  describe 'A saved query' do
    it 'should save a new search' do
      expect(subject).to be_valid
    end

    it 'should update the last saved search' do
      user = User.create(email: 'elisha@gmail', password: '123456e')
      Searches.new('Anything', user).save_query
      expect(subject.updated_at).to be > MySearch.first.updated_at
    end
  end
end
