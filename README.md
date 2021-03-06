# TL;DR;

First, configure a key combo by setting `g:do_it_mapping` in your vimrc. Then hit your configured key combo,
invoke the command you want to execute as if you were doing it normally and from then on, that key combo will
just repeat that command.

# Say what...?

DoIt.vim provides the DoIt command, which just creates a buffer local mapping from the configured key combo to
the argument given, and then executes that mapping. It also creates a global mapping from the same key combo
to ':DoWhat '

Basically, you choose a key combo that you dont use for anything already and then the first time you use that
combo in a particular buffer, you tell it what you want to map that combo to and then it creates that mapping
locally.

# Why bother?

For any given buffer I often find there is a particular action that I want to do over and over again while
iterating on the contents of the buffer. For whatever reason, these actions always seem to be specific enough
that I can't generalize it enough to put it into a filetype plugin. I have gotten into the habit of always
binding this type of thing to the same key combo, and eventually I got fed up with typing 'nnoremap \<buffer\>
g\<CR\> ...' so I made this plugin to streamline that process. 

# Usage

There are two ways to use it. Running this...

    :DoWhat :echom "hello"

...is equivalent to this...

    :nnoremap <buffer> g<CR> :echom "hello"<CR>

except with your value of `g:do_it_mapping` instead of g\<CR\>. You can also use regular key combos instead of
ex commands, so this...

    :DoWhat caphello<Esc>

... is equivalent to this...

    :nnoremap <buffer> g<CR> caphello<Esc>

Note that when binding to ex commands, you don't have to explicitly add '\<CR\>' to the end of the mapping.
That way that you can just hit your configured key combo, type the command you want to execute as if you were
doing it normally and from then on, that key combo will just repeat that command.
