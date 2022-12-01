require 'rails_helper'

RSpec.describe 'my_searches/new', type: :view do
  before(:each) do
    assign(:my_search, MySearch.new(
                         body: 'MyString',
                         user: nil
                       ))
  end

  it 'renders new my_search form' do
    render

    assert_select 'form[action=?][method=?]', my_searches_path, 'post' do
      assert_select 'input[name=?]', 'my_search[body]'

      assert_select 'input[name=?]', 'my_search[user_id]'
    end
  end
end
