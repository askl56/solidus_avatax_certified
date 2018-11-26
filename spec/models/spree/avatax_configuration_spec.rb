require 'spec_helper'

describe Spree::AvataxConfiguration, type: :model do
  subject { described_class }

  describe '.environment' do
    before { allow(Rails).to receive(:env) { rails_env.inquiry } }

    context 'when in "test" Rails environment' do
      let(:rails_env) { "test" }

      it 'returns :sandbox' do
        expect(subject.environment).to eq(:sandbox)
      end
    end

    context 'when in "development" Rails environment' do
      let(:rails_env) { "development" }

      it 'returns :production' do
        expect(subject.environment).to eq(:production)
      end
    end

    context 'when in "production" Rails environment' do
      let(:rails_env) { "production" }

      it 'returns :production' do
        expect(subject.environment).to eq(:production)
      end
    end

    context 'when in a custom Rails environment' do
      let(:rails_env) { "custom" }

      it 'returns :production' do
        expect(subject.environment).to eq(:production)
      end
    end
  end

end
