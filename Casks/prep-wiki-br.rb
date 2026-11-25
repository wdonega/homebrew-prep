cask "prep-wiki-br" do
  arch arm: "arm64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "15ea067a0addc9ae180b3ff06de51ad45aaf92c9daadfc74a85aea80644c60c9",
         intel: "72d52aee06e473c9240ed4d17887b2f2efd7e9b8c69c29943c6821a9e1a283ec"

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
