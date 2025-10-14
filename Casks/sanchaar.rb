cask "sanchaar" do
  version "0.3.2"

  on_arm do
    sha256 "9e58131efd22bec16e7698e333e6e44d6831d7c7191efc70d3fd99551d0f702f"

    url "https://github.com/nrjais/sanchaar/releases/download/#{version}/Sanchaar_macOS_aarch64.dmg"
  end
  on_intel do
    sha256 "435fe2e48a5350e605f7c4e869c1dc4f86720a3b7060edd717953dd4436982af"

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
