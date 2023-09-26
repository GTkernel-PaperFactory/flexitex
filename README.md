# FlexiTeX: Flexible LaTeX Template ✍️
[![Compile](https://github.com/GTkernel-PaperFactory/flexitex/actions/workflows/compile.yaml/badge.svg)](https://github.com/GTkernel-PaperFactory/flexitex/actions/workflows/compile.yaml)
[![Health](https://github.com/GTkernel-PaperFactory/flexitex/actions/workflows/health.yaml/badge.svg)](https://github.com/GTkernel-PaperFactory/flexitex/actions/workflows/health.yaml)
[![Lint](https://github.com/GTkernel-PaperFactory/flexitex/actions/workflows/lint.yaml/badge.svg)](https://github.com/GTkernel-PaperFactory/flexitex/actions/workflows/lint.yaml)

A forkable repository perfect for starting your next paper!

Features:

- 💪 Flexible! IEEE, ACM, and USENIX styles are included.
- 🔤 Spell checker with custom dictionary.
- ✅ Formatter and linter run automatically as you write.
- 🧑‍✈️ Copilot helps you write.
- 🫙 [Devcontainer](https://code.visualstudio.com/docs/devcontainers/containers)
= no LaTeX dependencies to install, just start writing.
- GitHub Actions integration:
  - 🏗️ Builds PDF and PDF-A (archival format commonly required by funding agencies).
  - 🧹 Lints `.tex` files.
  - 🩺 Generates health report.
  - 📦 Creates publisher-ready zip stripped of comments and unreferenced files.

## Getting Started
Open this directory in vscode then click the popup (or manually run the command)
to "open this repo in devcontainer". This will build a Docker container with all
latex dependencies already installed. This may require installing the
devcontainer extension and/or Docker.

If you fork this repo, don't forget to update (or remove) the status badges at
the top of this README.

The dictionary is located at `.vscode/ltex.dictionary.en-US.txt`, style files
may be stored in `styles/`, and figures in `figures/`.

## GitHub Actions
GitHub gives all accounts some number of free minutes per month to run programs
on source code. This repo is set up to do some helpful things when code is
pushed. These things are called workflows and here is some information about
each of them. Workflow configuration is in the `.github` directory.

1. **Compile:** LaTeX is compiled after pushing to the main branch. If a
build-breaking change is introduced, GitHub will email the author to let them
know. The built PDFs (both PDF and PDF-A archival format) are stored by GitHub
and can be found them in the Actions tab in the Compile workflow.

2. **Lint:** All `.tex` files are linted after pushing to the main branch. If a
stylistic error is introduced, the linter will email the author to let them
know. The linter is called [ChkTeX](https://www.nongnu.org/chktex/), and it has
a reasonable [default
configuration](https://github.com/j2kun/chktex-action/blob/main/.chktexrc) which
can be overridden by adding a `.chktexrc` file to the repo at the top level.

3. **Health:** The health of the project is checked with
[TeXtidote](https://github.com/sylvainhalle/textidote) after pushing to the main
branch. A report is generated in the Actions tab in the Health workflow. The
report will highlight mistakes like accidentally repeated words, spelling (using
an english dictionary and the custom dictionary file
`.vscode/ltex.dictionary.en-US.txt`), grammar mistakes, and style issues. Note
that vscode will also highlight the same errors as you write, so the health
report is more for a final check, or for those who do not use vscode.

4. **Source Package:** The project is cleaned and packaged in a way that is
appropriate for publication to arXiv or other publishers using
[arxiv-latex-cleaner](https://github.com/google-research/arxiv-latex-cleaner)
after pushing to the main branch. This removes all comments, unused `.tex`
files, and unused images and creates a zip file of the cleaned files. The zip
artifact can be found in the Actions tab in the Source Package workflow. Only
the zip contains the stripped files, source files in the repo are not affected.

## Contributors
Contributions and suggestions welcome!
