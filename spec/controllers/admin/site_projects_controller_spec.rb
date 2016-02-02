require 'rails_helper'

module Portfolio
  module Admin
    RSpec.describe SiteProjectsController, type: :controller do
      routes { Portfolio::Engine.routes }

      let(:admin_user) { create :admin_user }

      describe 'GET index' do
        context 'when no admin user authenticated' do
          before { get :index, site_id: 0 }
          it { expect(response).to redirect_to(new_admin_user_session_path) }
        end

        context 'when admin user authenticated' do
          before do
            sign_in admin_user
            get :index, site_id: site.id
          end

          let(:site) { create :site }

          it { expect(response).to render_template('index') }
        end
      end

      describe 'GET new' do
        context 'when no admin user authenticated' do
          before { get :new, site_id: 0 }
          it { expect(response).to redirect_to(new_admin_user_session_path) }
        end

        context 'when admin user authenticated' do
          before do
            sign_in admin_user
            get :new, site_id: site.id
          end

          let(:site) { create :site }

          it { expect(response).to render_template('new') }
        end
      end

      describe 'GET edit' do
        context 'when no admin user authenticated' do
          before { get :edit, site_id: 0, id: 0 }
          it { expect(response).to redirect_to(new_admin_user_session_path) }
        end

        context 'when admin user authenticated' do
          before do
            sign_in admin_user
            get :edit, site_id: site.id, id: item.id
          end

          let(:site) { create :site }
          let(:item) { create(:site_project, site: site) }

          it { expect(response).to render_template('edit') }
        end
      end

      describe 'POST create' do
        context 'when no admin user authenticated' do
          before { post :create, site_id: 0 }
          it { expect(response).to redirect_to(new_admin_user_session_path) }
        end

        context 'when admin user authenticated' do
          before do
            sign_in admin_user
            post :create, site_id: site.id, site_project: { title: 'proj1' }
          end

          let(:site) { create :site }

          it {
            expect(response).to redirect_to(
                edit_admin_site_site_project_path(site.id, assigns(:item).id)
              )
          }
        end
      end

      describe 'PUT update' do
        context 'when no admin user authenticated' do
          before { post :create, site_id: 0 }
          it { expect(response).to redirect_to(new_admin_user_session_path) }
        end

        context 'when admin user authenticated' do
          before do
            sign_in admin_user
            put :update, site_id: site.id, id: item.id, site_project: { title: 'new title' }
          end

          let(:site) { create :site }
          let(:item) { create(:site_project, site: site) }

          it {
            expect(response).to redirect_to(
              edit_admin_site_site_project_path(site.id, assigns(:item).id)
            )
            expect(assigns(:item).title).to eq 'new title'
          }
        end
      end

      describe 'DELETE destroy' do
        context 'when no admin user authenticated' do
          before { delete :destroy, site_id: 0, id: 0 }
          it { expect(response).to redirect_to(new_admin_user_session_path) }
        end

        context 'when admin user authenticated' do
          before do
            sign_in admin_user
            delete :destroy, site_id: site.id, id: item.id
          end

          let(:site) { create :site }
          let(:item) { create(:site_project, site: site) }

          it {
            expect(response).to redirect_to(admin_site_site_projects_path)
          }
        end
      end
    end
  end
end
