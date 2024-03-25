FROM ubuntu:jammy

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    texlive-latex-base texlive-fonts-recommended texlive-fonts-extra \
    texlive-latex-extra texlive-extra-utils texlive-bibtex-extra biber \
    texlive-science chktex git make latexmk ghostscript \
    python3 python-is-python3 python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade pip \
    && pip install arxiv_latex_cleaner

ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=${USER_UID}
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
USER $USERNAME