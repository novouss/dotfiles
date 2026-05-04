#!bin/bash/

curl -s "https://unicode.org/Public/emoji/latest/emoji-test.txt" | \
grep -E 'fully-qualified' | \
sed -E 's/.*# //' | \
sed -E 's/ E[0-9]+\.[0-9]+ / /' | \
sed -E 's/^[[:space:]]+//' | \
grep -v '^\s*$' > $HOME/dotfiles/.config/bemenu/emojis.txt
