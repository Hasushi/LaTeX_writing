FROM texlive/texlive:latest

# Install additional tools if necessary (e.g., make)
RUN apt-get update && apt-get install -y \
    make \
    latexmk \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workdir

# Default command
CMD ["bash"]
