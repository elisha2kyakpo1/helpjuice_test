RSpec.describe Searches, type: :service do
  subject do
    described_class.new(body: 'hello world', user_id: 1)
  end

  describe 'A saved query' do
    it 'should save a new search' do
      expect(subject.save_query).to be_a(MySearch)
    end

    it 'should update the last saved search' do
      subject.body = 'hello world'
      subject.user_id = 1
      subject.save_query
      expect(subject.save_query.updated_at).to be > MySearch.first.updated_at
    end
  end
end