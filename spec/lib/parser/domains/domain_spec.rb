require "spec_helper"

RSpec.describe Parser::Domain do
  describe "#run" do
    context "when call is not defined" do
      subject { described_class.run({}) }

      it "expected to raise exception" do
        expect { subject }.to raise_error(NoMethodError, "call method is not defined!")
      end
    end
  end
end
