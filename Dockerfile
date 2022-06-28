FROM ubuntu:18.04

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update the repository sources list
# and install dependencies
RUN apt-get update \
    &&  apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:neovim-ppa/unstable \
    && apt-get update \
    && apt-get install -y \
    curl \
    cmake \
    python-dev \
    python-pip \
    python3-dev \
    python3-pip \
    libncurses5-dev \
    libncursesw5-dev \
    pkg-config \
    autotools-dev \
    autoconf \
    ninja-build \
    gettext \
    libtool \
    libtool-bin \
    automake \
    g++ \
    unzip \
    doxygen \
    neovim \
    vim \
    git \
    build-essential \
    silversearcher-ag \
    && apt-get -y autoclean

# Install neovim python support
RUN pip install neovim pep8
RUN pip3 install neovim pep8
RUN pip2 install pynvim
RUN pip3 install pynvim

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_12 12.22.5
ENV NODE_14 14.18.2
ENV NODE_16 16.15.1
ENV NODE_18 18.4.0



# Compile VIM
RUN git clone https://github.com/vim/vim.git \
    && cd vim \
    && ./configure \
        --with-features=huge \
        --enable-python3interp \
        --enable-terminal \
        --enable-multibyte \
        --enable-fail-if-missing \
        --with-python3-command=/usr/bin/python3 \
    && make && make install

# Compile Neovim
RUN git clone https://github.com/neovim/neovim.git \
    && cd neovim \
    && make CMAKE_BUILD_TYPE=RelWithDebInfo && make install


# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_12 \
    && nvm install $NODE_14 \
    && nvm install $NODE_16 \
    && nvm install $NODE_18 \
    && nvm alias default $NODE_16 \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_16/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_16/bin:$PATH

# Install neovim python support
RUN pip install neovim pep8
RUN pip3 install neovim pep8

RUN npm install -g neovim
RUN npm install -g typescript
RUN npm install -g eslint

RUN mkdir ~/.config/nvim
#RUN mkdir ~/.config/nvim/rplugin
RUN mkdir /temp

ENV TMPDIR /temp
ENV TERM xterm256-color
ENV TERM xterm

# install vim-plug
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install fuzzy finder
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN /root/.fzf/install --bin

# copy init.vim and rplugin into container
COPY init.vim /root/.config/nvim/init.vim
COPY init.vim /root/.vimrc
COPY colors /root/.vim/colors
COPY colors /root/.config/nvim/colors
COPY rplugin /root/.config/nvim/rplugin

# install all plugins
RUN nvim --headless +PlugInstall +qall
RUN nvim +UpdateRemotePlugins +q
#RUN cd ~/.vim/plugged/YouCompleteMe && ./install.py --js-completer --tern-completer

# install coc.nvim extensions
RUN mkdir -p "$HOME/.config/coc/extensions"
WORKDIR "$HOME/.config/coc/extensions"
RUN echo '{"dependencies": {}}' > package.json
RUN npm install \
  coc-docker \
  coc-prettier \
  coc-pairs \
  coc-ultisnips \
  coc-tsserver \
  coc-json \
  coc-html \
  coc-xml \
  coc-sql \
  coc-jest \
  coc-css \
  coc-fzf-preview \
  coc-go \
  coc-eslint \
  coc-git \
  coc-lua \
  coc-translator \
  coc-markdownlint \
  --prefix "$HOME/.config/coc/extensions" --save
  #--global-style --save --ignore-scripts --no-bin-links --no-package-lock --only=prod

ENV PATH "/root/bin:$PATH"

RUN mkdir /data
WORKDIR /data

ENTRYPOINT nvim

