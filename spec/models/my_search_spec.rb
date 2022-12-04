require 'rails_helper'

RSpec.describe MySearch, type: :model do
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

  describe 'Validations' do
    
    it '@my_sesarch should be valid' do
      expect(@my_search).to be_valid
    end

    it 'The body should not be blank' do
      @my_search.body = nil
      expect(@my_search).to_not be_valid
    end

    it 'Should save when the body is not blank' do
      @my_search.body = 'hello world body'
      @my_search.user_id = 1
      expect(@my_search).to be_valid
    end

    it 'Should not save without user_id' do
      @my_search.user_id = nil
      expect(@my_search).to_not be_valid
    end
  end
end
