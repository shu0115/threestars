require 'spec_helper'

describe "items/edit" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :user => nil,
      :category => nil,
      :content => nil,
      :star => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", item_path(@item), "post" do
      assert_select "input#item_user[name=?]", "item[user]"
      assert_select "input#item_category[name=?]", "item[category]"
      assert_select "input#item_content[name=?]", "item[content]"
      assert_select "input#item_star[name=?]", "item[star]"
      assert_select "input#item_name[name=?]", "item[name]"
    end
  end
end
