require "spec_helper"

RSpec.describe Parser::Views::Unique do
  describe "#run" do
    subject { described_class.run(log_lines: log_lines) }

    context "prints the list of webpages with unique views in order" do
      let(:filepath) { File.expand_path("./../../../../fixtures/valid.log", __FILE__) }
      let(:file) { File.new(filepath) }

      let(:log_lines) do
        file.map do |line|
          Parser::LogLine.new(line)
        end
      end

      let(:msg) { "\n> list of webpages with most unique page views also ordered\n\n/help_page/1 4 unique views\n/home 2 unique views\n/about 1 unique views\n/about/2 1 unique views\n/contact 1 unique views\n/index 1 unique views\n" }

      it do
        expect { subject }.to output(msg).to_stdout
      end
    end
  end
end

