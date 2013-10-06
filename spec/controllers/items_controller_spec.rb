require 'spec_helper'

describe ItemsController do
  # This should return the minimal set of attributes required to create a valid
  # Item. As you add validations to Item, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "user" => "" }
  end

  describe 'GET index' do
    before do
      @item = Item.create! valid_attributes
      controller.index
    end
    describe 'assigns all items as @items' do
      subject { controller.instance_variable_get('@items') }
      it { should eq([@item]) }
    end
  end

  describe 'GET show' do
    before do
      @item = Item.create! valid_attributes
      controller.show(@item.to_param)
    end
    describe 'assigns the requested item as @item' do
      subject { controller.instance_variable_get('@item') }
      it { should eq(@item) }
    end
  end

  describe 'GET new' do
    before do
      controller.new
    end
    describe 'assigns a new item as @item' do
      subject { controller.instance_variable_get('@item') }
      it { should be_a_new(Item) }
    end
  end

  describe 'GET edit' do
    before do
      @item = Item.create! valid_attributes
      controller.edit(@item.to_param)
    end
    describe 'assigns the requested item as @item' do
      subject { controller.instance_variable_get('@item') }
      it { should eq(@item) }
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      before do
        controller.should_receive(:redirect_to) {|u| u.should eq(Item.last) }
      end
      describe 'creates a new Item' do
        it { expect {
          controller.create(valid_attributes)
        }.to change(Item, :count).by(1) }
      end

      describe 'assigns a newly created item as @item and redirects to the created item' do
        before do
          controller.create(valid_attributes)
        end
        subject { controller.instance_variable_get('@item') }
        it { should be_a(Item) }
        it { should be_persisted }
      end
    end

    context 'with invalid params' do
      describe "assigns a newly created but unsaved item as @item, and re-renders the 'new' template" do
        before do
          Item.any_instance.stub(:save) { false }
          controller.should_receive(:render).with(:action => 'new')
          controller.create({ "user" => "invalid value" })
        end
        subject { controller.instance_variable_get('@item') }
        it { should be_a_new(Item) }
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      describe 'updates the requested item, assigns the requested item as @item, and redirects to the item' do
        before do
          @item = Item.create! valid_attributes
          controller.should_receive(:redirect_to).with(@item, anything)
          controller.update(@item.to_param, valid_attributes)
        end
        subject { controller.instance_variable_get('@item') }
        it { should eq(@item) }
      end
    end

    context 'with invalid params' do
      describe "assigns the item as @item, and re-renders the 'edit' template" do
        before do
          @item = Item.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Item.any_instance.stub(:save) { false }
          controller.should_receive(:render).with(:action => 'edit')
          controller.update(@item.to_param, { "user" => "invalid value" })
        end
        subject { controller.instance_variable_get('@item') }
        it { should eq(@item) }
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      @item = Item.create! valid_attributes
      controller.stub(:items_url) { '/items' }
      controller.should_receive(:redirect_to).with('/items')
    end
    it 'destroys the requested item, and redirects to the items list' do
      expect {
        controller.destroy(@item.to_param)
      }.to change(Item, :count).by(-1)
    end
  end
end
