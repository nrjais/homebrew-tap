cask "sanchaar" do
  auto_updates true
  version "0.3.0"
  name "Sanchaar"
  desc "Fast offline REST API Client"
  homepage "https://github.com/nrjais/sanchaar"

  on_arm do
    sha256 "be5f3a8ed3b123eeac5ae4bbe30dad9dd4d8512d875b10c4b7fcdad3dc95323a"

    url "https://github.com/nrjais/sanchaar/releases/download/#{version}/Sanchaar-#{version}-aarch64-apple-darwin.dmg"
  end
  on_intel do
    sha256 "d8392fef7cc1f4d254e2ef77033931c30419f88345f59d8036230370ec0ca6e9"

    url "https://github.com/nrjais/sanchaar/releases/download/#{version}/Sanchaar-#{version}-x86_64-apple-darwin.dmg"
  end

  livecheck do
    url :homepage
    strategy :github_latest
  end

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
