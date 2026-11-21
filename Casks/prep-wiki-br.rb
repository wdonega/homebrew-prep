cask "prep-wiki-br" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "0d80b4d637a561567a188b414f17274f30a28f4e3fc6dd298418f6a9875dc593",
         intel: "3296b5b0476c6c8c2557d07c8d5e538e7c9a208eda5bee80dc399973bec2aa19"

  url "https://github.com/wdonega/prep-wiki-br/releases/download/desktop-v#{version}/prep-wiki-br-#{version}-mac-#{arch}.zip"
  name "Prep Wiki BR"
  desc "Biblioteca offline em portugues"
  homepage "https://prep.bigode.org/"

  livecheck do
    url :url
    regex(/^desktop-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on macos: :monterey

  app "Prep Wiki BR.app"

  # O app tem só a assinatura caseira (ad-hoc), sem a conta paga da Apple. Sem isto, o macOS bloqueia a
  # primeira abertura e a pessoa tem de liberar em Ajustes > Privacidade e Segurança. Vale só para este app.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Prep Wiki BR.app"]
  end

  uninstall quit: "org.bigode.prep"

  # Os acervos baixados ficam nesta pasta: o zap apaga tudo, inclusive eles.
  zap trash: "~/Library/Application Support/Prep Wiki BR"

  caveats <<~EOS
    Os acervos baixados ficam em ~/Library/Application Support/Prep Wiki BR.
    Desinstalar não apaga essa pasta; "brew uninstall --zap" apaga.
  EOS
end
