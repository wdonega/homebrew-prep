# Homebrew do Prep Wiki BR

Instala no Mac o [Prep Wiki BR](https://prep.bigode.org), a biblioteca de preparação, autonomia e saúde que funciona sem internet, em português.

```bash
brew install --cask wdonega/prep/prep-wiki-br
```

O app aparece em Aplicativos. Para atualizar: `brew upgrade --cask prep-wiki-br`.

- **Mac:** Apple Silicon e Intel, com macOS 12 (Monterey) ou mais novo.
- **Acervos:** ficam em `~/Library/Application Support/Prep Wiki BR`. Desinstalar não apaga a pasta; `brew uninstall --zap --cask prep-wiki-br` apaga.
- **Assinatura:** o app tem só a assinatura caseira (ad-hoc), sem a conta paga da Apple. Por isso a receita tira a marca de quarentena do app depois de instalar; sem isso, o macOS bloquearia a primeira abertura. Quem baixar o zip direto da release, sem o Homebrew, precisa liberar o app em Ajustes do Sistema → Privacidade e Segurança → "Abrir mesmo assim".

O código do app e o resto do projeto estão em [wdonega/prep-wiki-br](https://github.com/wdonega/prep-wiki-br). A receita é atualizada sozinha a cada release nova, pelo workflow [`atualizar.yml`](.github/workflows/atualizar.yml).
