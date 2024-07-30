require 'rails_helper'
require 'iterable'

RSpec.describe EventsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    # @user = User.create!(email: 'test@example.com', password: 'password')
    sign_in user
  end

  describe 'POST #send_event' do
    before do
      allow(Iterable::Events).to receive(:new).and_return(true)
    end

    it 'sends an event to Iterable' do
      post :send_event, params: { event_name: 'TestEvent' }
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq("Event 'TestEvent' sent successfully!")
    end

    it 'handles errors gracefully' do
      allow(Iterable::Events).to receive(:new).and_raise(StandardError, 'Some error')
      post :send_event, params: { event_name: 'TestEvent' }
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to include("Failed to send event 'TestEvent'")
    end
  end

  describe 'POST #send_email' do
    before do
      allow(Iterable::Email).to receive(:new).and_return(true)
    end

    it 'sends an email to user via iterable' do
      post :send_email, params: { event_name: 'TestEmail' }
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq("Event 'TestEmail' sent successfully!")
    end

    it 'handles errors gracefully' do
      allow(Iterable::Email).to receive(:new).and_raise(StandardError, 'Some error')
      post :send_event, params: { event_name: 'TestEmail' }
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to include("Failed to send event 'TestEmail'")
    end
  end
end
