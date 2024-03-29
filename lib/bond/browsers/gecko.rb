class Bond
  module Browsers
    module Gecko
      def self.extend?(agent)
        agent.application && agent.application.product == "Mozilla"
      end

      GeckoBrowsers = %w(
        Firefox
        Camino
        Iceweasel
        Seamonkey
      ).freeze

      def browser
        GeckoBrowsers.detect { |browser| respond_to?(browser) } || super
      end

      def version
        send(browser).version || super
      end

      def platform
        if comment = application.comment
          if comment[0] == 'compatible'
            nil
          elsif /^Windows / =~ comment[0]
            'Windows'
          else
            comment[0]
          end
        end
      end

      def security
        Security[application.comment[1]] || :strong
      end

      def os
        if comment = application.comment
          i = if comment[1] == 'U'
            2
          elsif /^Windows / =~ comment[0]
            0
          else
            1
          end

          OperatingSystems.normalize_os(comment[i])
        end
      end

      def localization
        if comment = application.comment
          comment[3]
        end
      end
    end
  end
end
