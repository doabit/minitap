module Minitest

  def self.plugin_minitap_options(opts, options)
    opts.on "--tapy", "Use TapY reporter." do
      options[:minitap] = 'tapy'
    end
    opts.on "--tapj", "Use TapJ reporter." do
      options[:minitap] = 'tapj'
    end
  end

  def self.plugin_minitap_init(options)
    if options[:minitap]
      require 'minitap/minitest5'

      self.reporter.reporters.clear

      case options[:minitap] || ENV['rpt']
      when 'tapj'
        self.reporter << TapJ.new(options[:io], options)
      when 'tapy'
        self.reporter << TapY.new(options[:io], options)
      end
    end
  end

end

