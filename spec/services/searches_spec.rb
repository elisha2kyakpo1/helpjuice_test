RSpec.describe Searches, type: :service do
  before(:all) do
    @user = User.create(
      name: 'Elisha kyakopo',
      password: '123456e',
      email: 'elisha@gmail.com'
    )

    @my_search = MySearch.create(
      body: 'Hello World!',
      user_id: @user.id
    )
  end

  describe 'A saved query' do
    it 'should save a new search' do
      Searches.new('I was', 1).save_query
      Searches.new('I was working', 1).save_query
      Searches.new('I was working on a project', 1).save_query
      expect(@my_search.body).to be 'I was working on a project'
    end

    it 'should update the last saved search' do
      expect(@my_search.save_query.updated_at).to be > MySearch.first.updated_at
    end
  end
end
