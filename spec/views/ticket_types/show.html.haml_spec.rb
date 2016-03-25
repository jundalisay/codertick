require 'rails_helper'

RSpec.describe "ticket_types/show", type: :view do
  before(:each) do
    @ticket_type = assign(:ticket_type, TicketType.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
