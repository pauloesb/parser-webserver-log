require "spec_helper"

RSpec.describe Parser::LogLine do
  describe "#valid?" do

    subject { described_class.new(log_line).valid? }

    context "when is false" do
      let(:log_line) { "/home 336.284.013." }

      it { is_expected.to be_falsey }
    end

    context "when is true" do
      let(:log_line) { "/home 0.0.0.0" }

      it { is_expected.to be_truthy }
    end
  end
end
