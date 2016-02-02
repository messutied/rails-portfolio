require 'rails_helper'

module Portfolio
  module Admin
    RSpec.describe SitesController, type: :controller do
      routes { Portfolio::Engine.routes }

      context 'when no admin user authenticated' do
        it_behaves_like 'a protected resource', 'site'
      end

      context 'when admin user authenticated' do
        let(:admin_user) { create :admin_user }
        before { sign_in admin_user }

        describe 'GET index' do
          before { get :index }
          it { expect(response).to render_template('index') }
        end

        describe 'GET new' do
          before { get :new }
          it { expect(response).to render_template('new') }
        end

        describe 'GET edit' do
          let(:record) { create :site }
          before { get :edit, id: record.id }
          it { expect(response).to render_template('edit') }
        end

        describe 'POST create' do
          before { get :create, site: {
            person_name: 'ed', job_title: 'senior rails dev' } }

          it {
            expect(response).to redirect_to(
              show_portfolio_path(assigns(:site).key)
            )
          }
        end

        describe "PUT update" do
          let(:site) { create :site }
          before { put :update, id: site.id, site: { person_name: 'ed2' } }

          it {
            expect(response).to redirect_to(
              show_portfolio_path(site.key)
            )
            expect(assigns(:site).person_name).to eq 'ed2'
          }
        end

        describe "DELETE destroy" do
          let(:site) { create :site }
          before { delete :destroy, id: site.id }

          it { expect(response).to redirect_to([:admin, :sites]) }
          it { expect(Site.find_by_id(site.id)).to be nil }
        end
      end
    end
  end
end
