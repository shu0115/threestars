require 'spec_helper'

describe "items/new" do
  before(:each) do
    assign(:item, stub_model(Item,
      :user => nil,
      :category => nil,
      :content => nil,
      :star => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", items_path, "post" do
      assert_select "input#item_user[name=?]", "item[user]"
      assert_select "input#item_category[name=?]", "item[category]"
      assert_select "input#item_content[name=?]", "item[content]"
      assert_select "input#item_star[name=?]", "item[star]"
      assert_select "input#item_name[name=?]", "item[name]"
    end
  end
end
