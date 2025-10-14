cask "sanchaar" do
  version "0.3.1"

  on_arm do
    sha256 "3deaa8b2fe4478656ef60ee385c81e4eadd2215449fc96fdf11937a8347ae125"

    url "https://github.com/nrjais/sanchaar/releases/download/#{version}/Sanchaar_macOS_aarch64.dmg"
  end
  on_intel do
    sha256 "8a3898e98aea98919c2594f44df22d132c8f9299fbadcdd9d85f47856e826397"

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
