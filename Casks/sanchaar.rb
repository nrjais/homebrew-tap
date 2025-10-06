cask "sanchaar" do
  version "0.1.1"

  on_arm do
    sha256 "c321d21690d8429b76c349675a12ed30cc59f2a9d9d0ed00b04fb2fa3f833375"

    url "https://github.com/nrjais/sanchaar/releases/download/#{version}/Sanchaar-#{version}-aarch64-apple-darwin.dmg"
  end
  on_intel do
    sha256 "9f9885d723db63db8d945b2c74d792f36a915b4f038c3f02d8e3fa3de3d376a3"

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
