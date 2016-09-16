require 'rails_helper'

RSpec.describe 'Books', type: :request do
	let(:ruby_microscope) { create(:ruby_microscope) }
	let(:rails_tutorial) { create(:ruby_on_rails_tutorial) }
	let(:books) { [ ruby_microscope, rails_tutorial ] }
	describe 'GET /api/books' do
		before { books }
		context 'default behaviour' do
			before { get '/api/books' }
			it 'receives HTTP status 200' do
				get '/api/books'
				expect(response.status).to eq 200
			end
			it 'receives a json with the "data" root key' do
				expect(json_body['data']).to_not be nil
			end
			it 'receives all 2 books' do 
				expect(json_body['data'].size).to eq 2
			end
		end
	end

end