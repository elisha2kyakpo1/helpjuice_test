require 'rails_helper'

RSpec.describe "my_searches/show", type: :view do
  before(:each) do
    assign(:my_search, MySearch.create!(
      body: "Body",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Body/)
    expect(rendered).to match(//)
  end
end
