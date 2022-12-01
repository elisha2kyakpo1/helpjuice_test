require 'rails_helper'

RSpec.describe MySearchesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/my_searches').to route_to('my_searches#index')
    end

    it 'routes to #new' do
      expect(get: '/my_searches/new').to route_to('my_searches#new')
    end

    it 'routes to #show' do
      expect(get: '/my_searches/1').to route_to('my_searches#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/my_searches/1/edit').to route_to('my_searches#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/my_searches').to route_to('my_searches#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/my_searches/1').to route_to('my_searches#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/my_searches/1').to route_to('my_searches#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/my_searches/1').to route_to('my_searches#destroy', id: '1')
    end
  end
end
