check_status = ->(action){ "check status in #{action} of management screen" }

shared_examples check_status.call('#index') do
  before { sign_in_as_admin }
  subject { get :index }
  it { is_expected.to be_success }
end

shared_examples check_status.call('#show') do |model_class|
  lower_name = model_class.class_name.downcase
  before do
    sign_in_as_admin
    instance_variable_set("@#{lower_name}", FactoryGirl.create(lower_name))
  end
  subject { get :show, id: eval("@#{lower_name}") }
  it { is_expected.to be_success; }
end

shared_examples check_status.call('#new') do
  before { sign_in_as_admin }
  subject { get :new }
  it { is_expected.to be_success }
end

shared_examples check_status.call('#edit') do |model_class|
  lower_name = model_class.name.downcase
  before do
    sign_in_as_admin
    instance_variable_set("@#{lower_name}", FactoryGirl.create(lower_name))
  end
  subject { get :edit, id: eval("@#{lower_name}") }
  it { is_expected.to be_success }
end

shared_examples check_status.call('#create') do |model_class|
  lower_name = model_class.name.downcase
  before { sign_in_as_admin }
  before do
    sign_in_as_admin
    instance_variable_set("@#{lower_name}_params", attributes_with_foreign_keys(lower_name))
  end
  it do
    expect {
      post :create, eval("{ #{lower_name}: @#{lower_name}_params }")
    }.to change(model_class, :count).by(1)
  end
end

shared_examples check_status.call('#update') do |model_class|
  lower_name = model_class.name.downcase
  before do
    sign_in_as_admin
    instance_variable_set("@#{lower_name}_params", FactoryGirl.attributes_for(lower_name))
    instance_variable_set("@#{lower_name}", FactoryGirl.create(lower_name))
    patch :update, eval("{id: @#{lower_name}, #{lower_name}: @#{lower_name}_params}")
    eval("@#{lower_name}").reload
  end
  columns = model_class.column_names.delete_if { |k, _| %w(id type created_at updated_at).member?(k) }
  columns.each do |column|
    it "updated #{column}" do
      v = eval("@#{lower_name}_params[:#{column}]") || eval("@#{lower_name}.#{column}")
      expect(eval("@#{lower_name}.#{column}")).to eq v
    end
  end
end

shared_examples check_status.call('#destroy') do |model_class|
  lower_name = model_class.name.downcase
  before do
    sign_in_as_admin
    instance_variable_set("@#{lower_name}", FactoryGirl.create(lower_name))
  end
  it do
    expect { delete :destroy, id: eval("@#{lower_name}") }.to change(model_class, :count).by(-1)
  end
end
