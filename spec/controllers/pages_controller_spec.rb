require 'rails_helper'

# for static pages
describe PagesController, type: :controller do
  describe '#show' do
    %w(about).each do |page|
      context "on GET to page/#{page}" do
        before do
          get :show, id: page
        end

        it { should respond_with(:success) }
        it { should render_template(page) }
      end
    end

    it 'Should have comments' do
      FactoryGirl.create(:comment,
                         commentable_type: 'PageAbout',
                         commentable_id: 1,
                         body: 'Comment on about')

      get :show, id: 'about'

      expect(assigns(:comments).first.body).to eq 'Comment on about'
    end
  end
end
