cask "sanchaar" do
  version "0.3.1"

  on_arm do
    sha256 "c02ef28f517af2e399965b8c28e40ab0ca17e84a8a64d38fc5ec4d17f1750968"

    url "https://github.com/nrjais/sanchaar/releases/download/#{version}/Sanchaar_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "4c0d85d176c26581aab937ce049c15c1b7694a5799cc4122f6e3f00ad2f535eb"

    url "https://github.com/nrjais/sanchaar/releases/download/#{version}/Sanchaar_#{version}_x64.dmg"
  end

  name "Sanchaar"
  desc "Fast offline REST API Client"
  homepage "https://github.com/nrjais/sanchaar"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  auto_updates true

  app "Sanchaar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Sanchaar.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.nrjais.sanchaar",
    "~/Library/Caches/com.nrjais.sanchaar",
    "~/Library/Preferences/com.nrjais.sanchaar.plist",
    "~/Library/Saved Application State/com.nrjais.sanchaar.savedState",
  ]
end
