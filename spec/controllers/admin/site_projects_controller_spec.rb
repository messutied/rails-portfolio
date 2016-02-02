require 'rails_helper'

module Portfolio
  module Admin
    RSpec.describe SiteProjectsController, type: :controller do
      routes { Portfolio::Engine.routes }

      context 'when no admin user authenticated' do
        it_behaves_like 'a protected nested resource', 'site_project', 'site'
      end

      context 'when admin user authenticated' do
        let(:admin_user) { create :admin_user }
        before { sign_in admin_user }

        describe 'GET index' do
          let(:site) { create :site }
          before { get :index, site_id: site.id }

          it { expect(response).to render_template('index') }
        end

        describe 'GET new' do
          let(:site) { create :site }
          before { get :new, site_id: site.id }

          it { expect(response).to render_template('new') }
        end

        describe 'GET edit' do
          let(:site) { create :site }
          let(:item) { create(:site_project, site: site) }
          before { get :edit, site_id: site.id, id: item.id }

          it { expect(response).to render_template('edit') }
        end

        describe 'POST create' do
          let(:site) { create :site }
          before {
            post :create, site_id: site.id, site_project: { title: 'proj1' }
          }

          it {
            expect(response).to redirect_to(
              edit_admin_site_site_project_path(site.id, assigns(:item).id)
            )
          }
        end

        describe 'PUT update' do
          let(:site) { create :site }
          let(:item) { create(:site_project, site: site) }

          before do
            put :update, site_id: site.id, id: item.id,
                site_project: { title: 'new title' }
          end

          it {
            expect(response).to redirect_to(
              edit_admin_site_site_project_path(site.id, assigns(:item).id)
            )
            expect(assigns(:item).title).to eq 'new title'
          }
        end

        describe 'DELETE destroy' do
          let(:site) { create :site }
          let(:item) { create(:site_project, site: site) }

          before { delete :destroy, site_id: site.id, id: item.id }

          it {
            expect(response).to redirect_to(admin_site_site_projects_path)
          }
          it { expect(SiteProject.find_by_id(item.id)).to be nil }
        end
      end
    end
  end
end
