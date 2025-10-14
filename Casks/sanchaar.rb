cask "sanchaar" do
  version "0.3.2"

  on_arm do
    sha256 "9b832987756b790d642f4ab4a36230c475529158fc582ec7072969f1b398815e"

    url "https://github.com/nrjais/sanchaar/releases/download/#{version}/Sanchaar_macOS_aarch64.dmg"
  end
  on_intel do
    sha256 "7aad6895b3a03652dda88e72506061a2d1ca062358ae1f328669bbcc8418a9e5"

    url "https://github.com/nrjais/sanchaar/releases/download/#{version}/Sanchaar_macOS_x64.dmg"
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
