require 'rails_helper'

RSpec.describe "ticket_types/edit", type: :view do
  before(:each) do
    @ticket_type = assign(:ticket_type, TicketType.create!())
  end

  it "renders the edit ticket_type form" do
    render

    assert_select "form[action=?][method=?]", ticket_type_path(@ticket_type), "post" do
    end
  end
end
