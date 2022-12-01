require 'rails_helper'

RSpec.describe 'my_searches/edit', type: :view do
  let(:my_search) do
    MySearch.create!(
      body: 'MyString',
      user: nil
    )
  end

  before(:each) do
    assign(:my_search, my_search)
  end

  it 'renders the edit my_search form' do
    render

    assert_select 'form[action=?][method=?]', my_search_path(my_search), 'post' do
      assert_select 'input[name=?]', 'my_search[body]'

      assert_select 'input[name=?]', 'my_search[user_id]'
    end
  end
end
