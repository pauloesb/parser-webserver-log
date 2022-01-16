require "spec_helper"

RSpec.describe Parser::Views::Most do
  describe "#run" do
    subject { described_class.run(log_lines: log_lines) }

    context "prints the list of webpages most views in order" do
      let(:filepath) { File.expand_path("./../../../../fixtures/valid.log", __FILE__) }
      let(:file) { File.new(filepath) }

      let(:log_lines) do
        file.map do |line|
          Parser::LogLine.new(line)
        end
      end

      let(:msg) { "\n> list of webpages with most page views ordered from most page views to less page views\n\n/help_page/1 4 visits\n/home 2 visits\n/about 1 visits\n/about/2 1 visits\n/contact 1 visits\n/index 1 visits\n" }

      it do
        expect { subject }.to output(msg).to_stdout
      end
    end
  end
end
