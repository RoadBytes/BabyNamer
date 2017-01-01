# for static pages
describe HighVoltage::PagesController, type: :controller do
  describe '#show' do
    %w(about).each do |page|
      context "on GET to /#{page}" do
        before do
          get :show, id: page
        end

        it { should respond_with(:success) }
        it { should render_template(page) }
      end
    end
  end
end
