require "./spec/spec_helper.rb"
require "rack/test"
require_relative '../../app'


RSpec.describe Application do
    include Rack::Test::Methods

    let(:app) {Application.new}

    context 'GET/name' do
        it "returns 200 OK with the right content" do
            # Send a GET request to /
            # and returns a response object we can test.
            response = get("/names?name=Julia, Mary, Karim")
      
            # Assert the response status code and body.
            expect(response.status).to eq(200)
            expect(response.body).to eq("Julia, Mary, Karim")
        end
    end

    context "POST /sort-names" do
        it "returns 200 OK with the right content" do
            response = post("/sort-names", name1: "Joe", name2: "Alice", name3: "Zoe", name4: "Julia", name5: "Kieran" )
            # expect(response.status).to eq(200)
            expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
        end
    end

    context "Get to /hello" do
        it "contains a h1 title" do
            response = get('/hello')
            expect(response.body).to include('<h1>Hello!</h1>')
        end
    end

end