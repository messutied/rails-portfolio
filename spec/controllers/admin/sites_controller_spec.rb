require 'rails_helper'

module Portfolio
  module Admin
    RSpec.describe SitesController, type: :controller do
      routes { Portfolio::Engine.routes }

      context 'when no admin user authenticated' do
        describe 'GET index' do
          before { get :index }
          it { expect(response).to redirect_to(new_admin_user_session_path) }
        end
      end
    end
  end
end
