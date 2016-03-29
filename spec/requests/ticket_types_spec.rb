require 'rails_helper'

RSpec.describe "TicketTypes", type: :request do
  before do
  	eventA = Event.create!
  	ticket_typeA = TicketType.create(:event => eventA)
  	# SAMPLE > application_1 = Factory.create(:application, :company => @company_1)
  end

  describe "GET /events/:event_id/ticket_types" do
    it "should go to the right path" do
      get event_ticket_types_path
      expect(response).to have_http_status(200)
    end
  end
end