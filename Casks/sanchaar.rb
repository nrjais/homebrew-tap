cask "sanchaar" do
  version "0.2.0"

  on_arm do
    sha256 "f83e22c170f90982de931f04e05d441b139983298d1f8c42f2f6984b0e8d9f98"

    url "https://github.com/nrjais/sanchaar/releases/download/#{version}/Sanchaar-#{version}-aarch64-apple-darwin.dmg"
  end
  on_intel do
    sha256 "6be74c349c5e0f04c429b298e8bd10688e8b739fe69d3a9e68e2ca3eff2f7a20"

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
