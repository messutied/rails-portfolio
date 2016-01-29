require 'rails_helper'

module Portfolio
  module Admin
    RSpec.describe Portfolio::Admin::SiteProjectsController, type: :controller do
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
    end
  end
end
