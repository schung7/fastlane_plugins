describe Fastlane::Actions::ProfileExpirationInfoAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The profile_expiration_info plugin is working!")

      Fastlane::Actions::ProfileExpirationInfoAction.run(nil)
    end
  end
end
