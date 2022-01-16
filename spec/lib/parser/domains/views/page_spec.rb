require "spec_helper"

RSpec.describe Parser::Views::Page do
  describe "#run" do
    subject { described_class.run({}) }

    describe "when start_message is not defined" do

      it "should raise an exception" do
        expect { subject }.to raise_error(NoMethodError, "start_message method is not defined!")
      end
    end

    describe "when process is not defined" do
      before do
        allow_any_instance_of(described_class).to receive(:print)
        allow_any_instance_of(described_class).to receive(:start_message) { "message" }
      end

      it "should raise an exception" do
        expect { subject }.to raise_error(NoMethodError, "process method is not defined!")
      end
    end

    describe "when view_type is not defined" do
      before do
        allow_any_instance_of(described_class).to receive(:print)
        allow_any_instance_of(described_class).to receive(:start_message) { "message" }
        allow_any_instance_of(described_class).to receive(:process) { {"abc" => 2} }
      end

      it "should raise an exception" do
        expect { subject }.to raise_error(NoMethodError, "view_type method is not defined!")
      end
    end

    describe "when all methods are defined" do

      before do
        allow_any_instance_of(described_class).to receive(:start_message) { "message" }
        allow_any_instance_of(described_class).to receive(:process) { {"abc" => 2} }
        allow_any_instance_of(described_class).to receive(:view_type) { "view" }
      end

      it "expected to show output" do
        expect { subject }.to output("\nmessage\nabc 2 view\n").to_stdout
      end
    end
  end
end
