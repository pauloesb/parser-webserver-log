require "spec_helper"

RSpec.describe Parser::Reader do
  describe "#run" do
    subject { described_class.run(file) }

    context "when parameter type is wrong" do
      let(:file) { Struct.new("Test", :a) }

      it "raises ArgumentError exception" do
        expect { subject }.to raise_error(ArgumentError, "Parameter is not a File!")
      end
    end

    context "when parameter type is correct" do
      let(:filepath) { File.expand_path("./../../../fixtures/invalid.log", __FILE__) }
      let(:file) { File.new(filepath) }

      before do
        allow_any_instance_of(described_class).to receive(:warn).and_return({})
      end

      it "return an array with valid LogLine instances" do
        log_lines = subject

        line_num = 0
        file.seek(0)
        file.reduce([]) do |arr, line|
          begin
            line_num += 1
            arr << Parser::LogLine.new(line, line_num)
          rescue Parser::InvalidLogLine
            arr
          end
        end.each_with_index do |log_line, index|
          expect(log_line.line).to eq(log_lines[index].line)
        end
      end
    end
  end
end

