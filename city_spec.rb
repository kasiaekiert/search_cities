require './city'
# Implement a city search functionality. The function takes a string (search text) as input and returns the found cities which corresponds to the search text.

# Prerequisites
# Create a collection of strings that will act as a database for the city names.

# City names: Paris, Budapest, Skopje, Rotterdam, Valencia, Vancouver, Amsterdam, Vienna, Sydney, New York City, London, Bangkok, Hong Kong, Dubai, Rome, Istanbul

# Requirements
# 1. If the search text is fewer than 2 characters, then should return no results. (It is an optimization feature of the search functionality.)

# 2. If the search text is equal to or more than 2 characters, then it should return all the city names starting with the exact search text.

# For example for search text "Va", the function should return Valencia and Vancouver
# 3. The search functionality should be case insensitive

# 4. The search functionality should work also when the search text is just a part of a city name

# For example "ape" should return "Budapest" city
# 5. If the search text is a "*" (asterisk), then it should return all the city names.

RSpec.describe City do
    subject {described_class.search(phrase)}

    describe ".search" do
        context "phrase is nil" do
            let(:phrase) { nil }
            
            it "returns nil" do
                expect(subject).to be_nil
            end
        end

        context "phrase is only one letter" do
          let(:phrase) { "a" }
          
          it "returns nil" do
              expect(subject).to be_nil
          end
        end

        context "phrase is 'Va' " do
          let(:phrase) { "Va" }
          
          it "it returns case insensitive results" do
            expect(subject).to eq(["Valencia", "Vancouver"])
          end
        end

        context "phrase is 'VA' -" do
            let(:phrase) { "VA" }
            
            it "it returns case insensitive results" do
              expect(subject).to eq(["Valencia", "Vancouver"])
            end
          end

          context "phrase is 'va' " do
            let(:phrase) { "va" }
            
            it "it returns case insensitive results" do
              expect(subject).to eq(["Valencia", "Vancouver"])
            end
          end

        context "phrase is 'Van'" do
          let(:phrase) { "Van" }
            
          it "it should show the name of the cities: Vancouver" do
            expect(subject).to eq(["Vancouver"])
          end
        end

        context "phrase is an interim part of city name" do
          let(:phrase) { "ape" }
          
          it "it returns the city name" do
            expect(subject).to eq(["Budapest"])
          end
        end

        context "phrase is 'on'" do
          let(:phrase) { "on" }
          
          it "it should show the name of the cities: London, Hong Kong" do
            expect(subject).to eq(["London", "Hong Kong"])
          end
        end

        context "phrase is '*'" do
          let(:phrase) { "*" }
          
          it "it should show return all cities" do
            expect(subject).to eq(["Paris", "Budapest", "Skopje", "Rotterdam", "Valencia", "Vancouver", "Amsterdam", "Vienna", "Sydney", "New York City", "London", "Bangkok", "Hong Kong", "Dubai", "Rome", "Istanbul"])
          end
        end

        context "where the city does not exist on the list" do
          let(:phrase) { "Warsaw" }

          it { expect(subject).to eq(nil) } 
        end
    end
end