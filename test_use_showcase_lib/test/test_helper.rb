$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
$LOAD_PATH.unshift File.expand_path("/home/virost/src/gapic-generator-ruby/shared/output/gapic/templates/showcase/lib", __dir__)
$LOAD_PATH.unshift File.expand_path("/home/virost/src/diregapic/google-showcase-dire/gapic-common/lib", __dir__)

require "test_use_showcase_lib"
require "minitest/autorun"
