# LaTeX Starter Pack ✍️
[![Compile](https://github.com/GTkernel-PaperFactory/vscode-latex-template/actions/workflows/compile.yaml/badge.svg)](https://github.com/GTkernel-PaperFactory/vscode-latex-template/actions/workflows/compile.yaml)
[![Health](https://github.com/GTkernel-PaperFactory/vscode-latex-template/actions/workflows/health.yaml/badge.svg)](https://github.com/GTkernel-PaperFactory/vscode-latex-template/actions/workflows/health.yaml)
[![Lint](https://github.com/GTkernel-PaperFactory/vscode-latex-template/actions/workflows/lint.yaml/badge.svg)](https://github.com/GTkernel-PaperFactory/vscode-latex-template/actions/workflows/lint.yaml)


Features:
- Dev container 📦 no need to install anything.
- Spell checker 🔤 with custom dictionary.
- Latex formatter ✅ runs automatically on every save.
- Copilot 🧑‍✈️️ to help you write.
- Build with GitHub 🏗️ cloud-based CI/CD.
  - Lint 🧹 on pushes and merges.
  - Health report 📋 to catch mistakes.
  - Source packager 📑 strip comments and unused junk for arXiv or publication.

## Getting Started
Open this directory in vscode then click the popup (or manually run the command)
to "open this repo in devcontainer". This will build a Docker container with all
latex dependencies already installed.

If you fork this repo, don't forget to update (or remove) the status badges at
the top of this README.

The dictionary is located at `.vscode/ltex.dictionary.en-US.txt`.

## GitHub Actions
GitHub gives all accounts some number of free minutes per month to run programs
on your source code, e.g. to build your code. This repo is set up to do some
helpful things when you push code. These things are called workflows and here is
some information about each of them.

1. **Compile** Your LaTeX is compiled when you push to the main branch. If your
code introduces a build-breaking change, GitHub will email you. The resultant
build artifact (paper.pdf) is stored by GitHub, you can find it in the Actions
tab in the Compile workflow.

2. **Lint** Your `.tex` files are linted when you push to the main branch. If
you commit a change which makes a stylistic error, the linter will correct it
for you in a subsequent commit. The linter is called
[ChkTeX](https://www.nongnu.org/chktex/), and it has a reasonable [default
configuration](https://github.com/j2kun/chktex-action/blob/main/.chktexrc) which
can be overriden by adding your own `.chktexrc` to the repo.

3. **Health** The health of the project is checked with
[TeXtidote](https://github.com/sylvainhalle/textidote) when you push to the main
branch. A report is generated in the Actions tab in the Health workflow. The
report will highlight accidentally repeated words, spelling (using the
dictionary `.vscode/ltex.dictionary.en-US.txt`), grammar mistakes, and style
issues. Note that vscode will also highlight the same errors as you write, so
the health report is more for a final check, or for those who do not use vscode.

4. **Source Package** The project is cleaned and packaged in a way that is
appropriate for publication to arXiv using
[arxiv-latex-cleaner](https://github.com/google-research/arxiv-latex-cleaner)
when you push to the main branch. This removes all comments, unused `.tex`
files, and unused images and creates a zip file of the cleaned files. The zip
artifact can be found in the Actions tab in the Source Package workflow.

## Contributors
Contributions and suggestions welcome!
