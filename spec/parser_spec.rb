require "spec_helper"
require "open3"

RSpec.describe "Parser" do
  describe "./parser.rb webserver.log" do
    context "when the command comes without the file name arg" do
      let(:msg) { "No file provided!\nUsage: ./parser.rb webserver.log\n" }

      it "expected to return an error" do
        expect do
          Open3.popen3("./parser.rb") do |_, _, e|
            print e.read
          end
        end.to output(msg).to_stdout
      end
    end

    context "when the command comes with no existent file" do
      let(:msg) { "Unable to open file: test.log!\n" }

      it "expected to return an error" do
        expect do
          Open3.popen3("./parser.rb test.log") do |_, _, e|
            print e.read
          end
        end.to output(msg).to_stdout
      end
    end

    context "when the log is valid" do
      let(:msg) { "\n> list of webpages with most page views ordered from most page views to less page views\n\n/help_page/1 4 visits\n/home 2 visits\n/about 1 visits\n/about/2 1 visits\n/contact 1 visits\n/index 1 visits\n\n> list of webpages with most unique page views also ordered\n\n/help_page/1 4 unique views\n/home 2 unique views\n/about 1 unique views\n/about/2 1 unique views\n/contact 1 unique views\n/index 1 unique views\n" }

      it "expected to return an error" do
        expect do
          Open3.popen3("./parser.rb spec/lib/fixtures/valid.log") do |_, o, _|
            print o.read
          end
        end.to output(msg).to_stdout
      end
    end

    context "when the log is invalid" do
      let(:msg) { "WARN - The line number 6 with value '444.701.448.104' is invalid!\nWARN - The line number 13 with value '/home 316433.849.805' is invalid!\n\n> list of webpages with most page views ordered from most page views to less page views\n\n/help_page/1 5 visits\n/about/2 2 visits\n/contact 2 visits\n/home 2 visits\n/about 1 visits\n\n> list of webpages with most unique page views also ordered\n\n/help_page/1 5 unique views\n/home 2 unique views\n/about 1 unique views\n/about/2 1 unique views\n/contact 1 unique views\n" }

      it "expected to return an error" do
        expect do
          Open3.popen3("./parser.rb spec/lib/fixtures/invalid.log") do |_, o, e|
            print e.read
            print o.read
          end
        end.to output(msg).to_stdout
      end
    end
  end
end

