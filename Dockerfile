FROM alpine
MAINTAINER Carlos Alberto Castaño <calbertts@gmail.com>

RUN apk add --update-cache --virtual build-deps --no-cache \
    curl \
    clang \
    autoconf \
    automake \
    cmake \
    g++ \
    libtool \
    libuv \
    linux-headers \
    lua5.3-dev \
    m4 \
    make \
    unzip \
    libtermkey-dev \
    lua-sec \
    python \
    py-pip \
    python-dev \
    python3 \
    python3-dev \
    ncurses ncurses-dev ncurses-libs ncurses-terminfo \
    nodejs \
    the_silver_searcher \
    vim \
    neovim \
    neovim-doc \
    && rm -rf /var/cache/apk/*

RUN apk add --update-cache \
    git

# Install neovim python support
RUN pip install neovim pep8
RUN pip3 install neovim pep8

RUN npm install -g neovim
RUN npm install -g typescript

RUN mkdir ~/.config/nvim
RUN mkdir ~/.config/nvim/rplugin
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

# copy init.vim into container
COPY init.vim /root/.config/nvim/init.vim
COPY init.vim /root/.vimrc
COPY colors /root/.vim/colors
COPY colors /root/.config/nvim/colors
COPY rplugin /root/.config/nvim/rplugin

# install all plugins
RUN vim +PlugInstall +qall
RUN nvim +UpdateRemotePlugins +q
RUN cd ~/.vim/plugged/YouCompleteMe && ./install.py --js-completer --tern-completer

ENV PATH "/root/bin:$PATH"

RUN mkdir /data
WORKDIR /data

ENTRYPOINT nvim
