require 'date'
require 'plist'

module Fastlane
  module Actions
    class ProfileExpirationInfoAction < Action
      def self.run(params)
        prov_prof = File.read(params[:provisioning_profile_filepath]).encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
        # Extracts the plist from the binary
        regexp = /.*(<\?xml .*<\/plist>).*/mn
        plist = prov_prof.match(regexp)[1]
        hash = Plist::parse_xml(plist)
        exp_date = hash["ExpirationDate"]
        expired = exp_date < DateTime.now

        [expired, exp_date]
      end

      def self.description
        "This plugin, given a filepath to a .mobileprovision file, will return whether or not that provisioning profile is expired and the DateTime that it expires"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :provisioning_profile_filepath,
                                  env_name: "PEI_PROVISIONING_PROFILE_FILEPATH", # The name of the environment variable
                               description: "The filepath to the provisioning profile",
                                  optional: false,
                                      type: String,
                              verify_block: proc do |value|
                                UI.user_error!('No path provided for the provisioning profile given to the ProfileExpirationInfoAction. Pass using `provisioning_profile_filepath: \'path/to/provisioning/profile\'`') if value.nil? || value.empty?
                              end)
        ]
      end

      def self.authors
        ["Steven Chung/swchung"]
      end

      def self.return_value
        "Array with 2 elements: whether or not the provisioning profile has expired and when it expires."
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?(platform)
      end
    end
  end
end
