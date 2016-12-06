module Fastlane
  module Helper
    class ProfileExpirationInfoHelper
      # class methods that you define here become available in your action
      # as `Helper::ProfileExpirationInfoHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the profile_expiration_info plugin helper!")
      end
    end
  end
end
