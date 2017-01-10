require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#tab_status(name)' do
    it "returns 'is-active' if name == '' and flash['tab_name'] is nil" do
      flash['tab_name'] = nil

      expect(tab_status('')).to eq 'is-active'
    end

    it "returns '' if name == '' and flash['tab_name'] is not" do
      flash['tab_name'] = 'latest'

      expect(tab_status('')).to eq ''
    end

    it "returns '' if name != '' and flash['tab_name'] is nil" do
      flash['tab_name'] = nil

      expect(tab_status('latest')).to eq ''
    end

    it "returns '' if argument != flash['tab_name']" do
      expect(tab_status('latest')).to eq ''
    end

    it "returns 'is-active' if argument is a key in flash" do
      flash['tab_name'] = 'latest'

      expect(tab_status('latest')).to eq 'is-active'
    end
  end
end
