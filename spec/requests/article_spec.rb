require 'rails_helper'

RSpec.describe 'Article', type: :request do
  describe 'GET /index' do
    before(:example) { get articles_path }
    it 'response status correct' do
      expect(response).to have_http_status(:success)
    end
    it 'renders correct template' do
      expect(response).to render_template('Show this article')
    end
    it 'response body contains correct placeholder text' do
      expect(response.body).to include('Articles')
    end
  end
end