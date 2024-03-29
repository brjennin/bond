require 'bond/comparable'
require 'bond/browsers'
require 'bond/operating_systems'
require 'bond/version'

class Bond
  # http://www.texsoft.it/index.php?m=sw.php.useragent
  MATCHER = %r{
    ^([^/\s]+)        # Product
    /?([^\s]*)        # Version
    (\s\(([^\)]*)\))? # Comment
  }x.freeze

  DEFAULT_USER_AGENT = "Mozilla/4.0 (compatible)"

  def self.parse(string)
    if string.nil? || string == ""
      string = DEFAULT_USER_AGENT
    end

    agents = []
    while m = string.to_s.match(MATCHER)
      agents << new(m[1], m[2], m[4])
      string = string[m[0].length..-1].strip
    end
    Browsers.extend(agents)
    agents
  end

  attr_reader :product, :version, :comment

  def initialize(product, version = nil, comment = nil)
    if product
      @product = product
    else
      raise ArgumentError, "expected a value for product"
    end

    if version && !version.empty?
      @version = Version.new(version)
    else
      @version = nil
    end

    if comment.respond_to?(:split)
      @comment = comment.split("; ")
    else
      @comment = comment
    end
  end

  include Comparable

  # Any comparsion between two user agents with different products will
  # always return false.
  def <=>(other)
    if @product == other.product
      if @version && other.version
        @version <=> other.version
      else
        0
      end
    else
      false
    end
  end

  def eql?(other)
    @product == other.product &&
      @version == other.version &&
      @comment == other.comment
  end

  def to_s
    to_str
  end

  def to_str
    if @product && @version && @comment
      "#{@product}/#{@version} (#{@comment.join("; ")})"
    elsif @product && @version
      "#{@product}/#{@version}"
    elsif @product && @comment
      "#{@product} (#{@comment.join("; ")})"
    else
      @product
    end
  end
end
