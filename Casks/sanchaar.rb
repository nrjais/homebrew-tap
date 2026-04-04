cask "sanchaar" do
  version "0.3.3"

  on_arm do
    sha256 "43abd5086fe7244da4137b1d77a7c2bec5db58bc45612079268db45d91700346"

    url "https://github.com/nrjais/sanchaar/releases/download/#{version}/Sanchaar_macOS_aarch64.dmg"
  end
  on_intel do
    sha256 "5c525b0d08353b5c14fef3449a8c3548197c2e83f7754324029f9e208d0a34a1"

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
