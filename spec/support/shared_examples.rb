RSpec.shared_examples "a protected resource" do |resource_name|
  describe 'GET index' do
    before { get :index }
    it { expect(response).to redirect_to(new_admin_user_session_path) }
  end

  describe 'GET new' do
    before { get :new }
    it { expect(response).to redirect_to(new_admin_user_session_path) }
  end

  describe 'GET edit' do
    before { get :edit, id: 0 }
    it { expect(response).to redirect_to(new_admin_user_session_path) }
  end

  describe 'POST create' do
    before { post :create, id: 0 }
    it { expect(response).to redirect_to(new_admin_user_session_path) }
  end

  describe 'PUT update' do
    before { put :update, id: 0 }
    it { expect(response).to redirect_to(new_admin_user_session_path) }
  end

  describe 'DELETE destroy' do
    before { put :destroy, id: 0 }
    it { expect(response).to redirect_to(new_admin_user_session_path) }
  end
end

RSpec.shared_examples "a protected nested resource" do |resource_name, parent_resource|
  describe 'GET index' do
    before { get :index, "#{parent_resource}_id" => 0 }
    it { expect(response).to redirect_to(new_admin_user_session_path) }
  end

  describe 'GET new' do
    before { get :new, "#{parent_resource}_id" => 0 }
    it { expect(response).to redirect_to(new_admin_user_session_path) }
  end

  describe 'GET edit' do
    before { get :edit, "#{parent_resource}_id" => 0, id: 0 }
    it { expect(response).to redirect_to(new_admin_user_session_path) }
  end

  describe 'POST create' do
    before { post :create, "#{parent_resource}_id" => 0, id: 0 }
    it { expect(response).to redirect_to(new_admin_user_session_path) }
  end

  describe 'PUT update' do
    before { put :update, "#{parent_resource}_id" => 0, id: 0 }
    it { expect(response).to redirect_to(new_admin_user_session_path) }
  end

  describe 'DELETE destroy' do
    before { put :destroy, "#{parent_resource}_id" => 0, id: 0 }
    it { expect(response).to redirect_to(new_admin_user_session_path) }
  end
end
