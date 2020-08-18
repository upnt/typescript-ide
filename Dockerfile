FROM upnt/docvim

ENV LANG="en_US.UTF-8" LANGUAGE="en_US:ja" LC_ALL="en_US.UTF-8"

# install
RUN apk add --no-cache git bash && \
    git clone https://github.com/upnt/dotfiles.git && \
    cd dotfiles && \
    bash init.sh && \
    bash deploy.sh bash && \
    bash deploy.sh nvim && \
    npm install typescript && \
# add plugins
    echo "[[plugins]]" >> ~/.config/nvim/dein.toml && \
    echo "repo = 'leafgarland/typescript-vim'" >> ~/.config/nvim/dein.toml && \
    echo "hook_add = 'let g:typescript_indent_disable = 1'" >> ~/.config/nvim/dein.toml && \
    echo "[[plugins]]" >> ~/.config/nvim/dein.toml && \
    echo "repo = 'jason0x43/vim-js-indent'" >> ~/.config/nvim/dein.toml && \
    echo "[[plugins]]" >> ~/.config/nvim/dein.toml && \
    echo "repo = 'HerringtonDarkholme/deoplete-typescript'" >> ~/.config/nvim/dein.toml && \
# install plugins
    nvim -c "call dein#install()" -c UpdateRemotePlugins -c q!

ENTRYPOINT ["nvim"]
