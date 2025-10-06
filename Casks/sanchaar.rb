cask "sanchaar" do
  version "0.1.3"

  on_arm do
    sha256 "e22364283422d27e70fb26e2e16c27e819f8df4954dac3aea5234e5c7018e54d"
    url "https://github.com/nrjais/sanchaar/releases/download/#{version}/Sanchaar-#{version}-aarch64-apple-darwin.dmg"
  end
  on_intel do
    sha256 "c3c40231a7ac7e662dfef0609ea90fc659aef3f8919d1c1bd480648d26710fa7"
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
