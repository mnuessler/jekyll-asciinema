$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end

require 'jekyll-asciinema'

TEST_DIR = File.dirname(__FILE__)
TMP_DIR  = File.expand_path("../tmp", TEST_DIR)

RSpec.configure do |config|

  def tmp_dir(*files)
    File.join(TMP_DIR, *files)
  end

  def source_dir(*files)
    tmp_dir('source', *files)
  end

  def dest_dir(*files)
    tmp_dir('dest', *files)
  end

  def doc_with_content(content, opts = {})
    my_site = site
    Jekyll::Document.new(source_dir('_test/doc.md'), {site: my_site, collection: collection(my_site)})
  end

  def collection(site, label = 'test')
    Jekyll::Collection.new(site, label)
  end

  def site(opts = {})
    conf = Jekyll::Utils.deep_merge_hashes(Jekyll::Configuration::DEFAULTS, opts.merge({
      "source"      => source_dir,
      "destination" => dest_dir
    }))
    Jekyll::Site.new(conf)
  end

  # Configure Rspec to accept only the new 'expect' syntax (see http://betterspecs.org/#expect)
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

end
