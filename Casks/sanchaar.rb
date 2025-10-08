cask "sanchaar" do
  version "0.3.0"
  auto_updates true

  on_arm do
    sha256 "f8c2103ab8285adaf0c07e10be4d7f2ee8cbc63f0583d6165552e17b63bc617e"

    url "https://github.com/nrjais/sanchaar/releases/download/#{version}/Sanchaar-#{version}-aarch64-apple-darwin.dmg"
  end
  on_intel do
    sha256 "eab823a6a9e57a4a1b723562af04328578cf8443897aa24d8d689c142a67bbd6"

    url "https://github.com/nrjais/sanchaar/releases/download/#{version}/Sanchaar-#{version}-x86_64-apple-darwin.dmg"
  end

  name "Sanchaar"
  desc "Fast offline REST API Client"
  homepage "https://github.com/nrjais/sanchaar"

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
