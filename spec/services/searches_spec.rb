RSpec.describe Searches, type: :service do
  let(:user) { User.create(email: 'elisha@gmail,com', password: '123456e', id: 1) }

  subject do
    described_class.new('Anything', user.id)
  end

  describe 'A saved query' do
    it 'should save a new search' do
      expect(subject.save_query).to be_valid
    end

    it 'should save the last search' do
      Searches.new('hello', user.id).save_query
      Searches.new('hello friends', user.id).save_query
      Searches.new('hello friends today', user.id).save_query
      expect(MySearch.first.body).to eql('hello friends today')
    end

    it 'Should remove the incomplete search' do
      Searches.new('hello', user.id).save_query
      Searches.new('hello friends', user.id).save_query
      Searches.new('hello friends today', user.id).save_query
      expect(MySearch.last.body).to eql('hello friends today')
    end

    it 'Should return incomplete searches' do
      Searches.new('hell', user.id).save_query
      Searches.new('hello fri', user.id).save_query
      expect(MySearch.last.body).to eql('hello fri')
    end
  end
end
