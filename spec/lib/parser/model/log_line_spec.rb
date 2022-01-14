require "spec_helper"

RSpec.describe Parser::LogLine do
  describe "#initialize" do
    let(:line_number) { 0 }
    context "when the line is valid" do
      let(:log_line) { "/home 336.284.013.234" }

      it "does not raise exception" do
        expect { described_class.new(log_line, line_number)}.not_to raise_error(Parser::InvalidLogLine)
      end
    end

    context "when the line is invalid" do
      let(:log_line) { "/home .0.0.0" }

      it "does raise exception" do
        expect { described_class.new(log_line, line_number) }.to raise_error(Parser::InvalidLogLine)
      end
    end
  end
end
