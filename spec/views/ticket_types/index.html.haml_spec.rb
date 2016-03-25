require 'rails_helper'

RSpec.describe "ticket_types/index", type: :view do
  before(:each) do
    assign(:ticket_types, [
      TicketType.create!(),
      TicketType.create!()
    ])
  end

  it "renders a list of ticket_types" do
    render
  end
end
