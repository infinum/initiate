module Initiate
  class Config
    mattr_accessor :use_bootstrap

    class << self
      alias_method :use_bootstrap?, :use_bootstrap
    end
  end
end
