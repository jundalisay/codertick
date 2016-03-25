require 'rails_helper'

RSpec.describe "ticket_types/new", type: :view do
  before(:each) do
    assign(:ticket_type, TicketType.new())
  end

  it "renders new ticket_type form" do
    render

    assert_select "form[action=?][method=?]", ticket_types_path, "post" do
    end
  end
end
