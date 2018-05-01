require "spec_helper"

RSpec.describe HomeController, type: :routing do
  describe "routing" do
      it 'routes to #index' do
        expect(:get => "/").to route_to('pages#index')
      end
  end
end