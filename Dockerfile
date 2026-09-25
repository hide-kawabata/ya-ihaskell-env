# Use the official IHaskell image as the base
FROM gibiansky/ihaskell:latest

# If your display packages require system libraries (like Cairo for charts or diagrams), 
# switch to root to install them via apt-get first.
USER root
RUN apt-get update && apt-get install -y \
    libmagic-dev \
    libcairo2-dev \
    libpango1.0-dev \
    && rm -rf /var/lib/apt/lists/*

# Switch back to the default user
USER me

# Tell stack to install the base ihaskell package globally, 
# along with any specific display extensions you want to use.
RUN stack install --fast \
    ihaskell \
    ihaskell-basic \
    ihaskell-diagrams \
    ihaskell-charts
