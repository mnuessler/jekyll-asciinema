require 'spec_helper'

describe Jekyll::Asciinema do
  it 'has a version number' do
    expect(Jekyll::Asciinema::VERSION).not_to be nil
  end
end

describe Jekyll::Asciinema::AsciicastTag do
  let(:doc) { doc_with_content(content) }
  let(:output) do
    doc.content = content
    doc.output  = Jekyll::Renderer.new(doc.site, doc).run
  end

  context "numeric asciicast ID" do
    let(:asciicast) { 1234 }

    context "valid tag" do
      let(:content) { "{% asciicast #{asciicast} %}" }

      it "produces the correct script tag" do
        expect(output.strip).to eq(%Q{<script src="https://asciinema.org/a/#{asciicast}.js" id="asciicast-#{asciicast}" async="async"></script>})
      end
    end

    context "valid tag with additional whitespace" do
      let(:asciicast) { 1234 }
      let(:content) { "{% asciicast   #{asciicast}    %}" }

      it "produces the correct script tag ignoring additional whitespace" do
        expect(output.strip).to eq(%Q{<script src="https://asciinema.org/a/#{asciicast}.js" id="asciicast-#{asciicast}" async="async"></script>})
      end
    end
  end

  context "alphanumeric asciicast ID" do
    let(:asciicast) { 'HRNK602wzYvYY0VPA5yRAiuia' }

    context "valid tag" do
      let(:content) { "{% asciicast #{asciicast} %}" }

      it "produces the correct script tag" do
        expect(output.strip).to eq(%Q{<script src="https://asciinema.org/a/#{asciicast}.js" id="asciicast-#{asciicast}" async="async"></script>})
      end
    end

    context "valid tag with quotes" do
      let(:asciicast) { 'HRNK602wzYvYY0VPA5yRAiuia' }
      let(:content) { "{% asciicast   '#{asciicast}'    %}" }

      it "produces the correct script tag ignoring quotes" do
        expect(output.strip).to eq(%Q{<script src="https://asciinema.org/a/#{asciicast}.js" id="asciicast-#{asciicast}" async="async"></script>})
      end
    end

    context "valid tag with additional whitespace" do
      let(:asciicast) { 'HRNK602wzYvYY0VPA5yRAiuia' }
      let(:content) { "{% asciicast   #{asciicast}    %}" }

      it "produces the correct script tag ignoring additional whitespace" do
        expect(output.strip).to eq(%Q{<script src="https://asciinema.org/a/#{asciicast}.js" id="asciicast-#{asciicast}" async="async"></script>})
      end
    end

  end

  context "missing asciicast ID" do
    let(:asciicast) { "" }
    let(:content) { "{% asciicast #{asciicast} %}" }

    it "throws an exception" do
      expect { output }.to raise_error { |error|
        expect(error).to be_a(ArgumentError)
        expect(error.message).to match(/^Syntax error in tag 'asciicast'/)
      }
    end
  end
end

# https://asciinema.org/docs/embedding
