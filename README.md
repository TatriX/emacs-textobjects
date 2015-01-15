Simple textobjects for emacs

## Usage
Get the code. For example: 
```sh
git clone https://github.com/TatriX/emacs-textobjects ~/.emacs.d/emacs-textobjects/
```
Then put into your .emacs something like this:
```elisp
(add-to-list 'load-path "~/.emacs.d/emacs-textobjects")
(require 'emacs-textobjects)
(global-set-key (kbd "C-c '") 'textobject-mark-inner)
(global-set-key (kbd "C-c \"") 'textobject-mark-outer)
```
Also be sure to enable any pairing mode:
```elisp
(electric-pair-mode t)
```

Calling textobject-mark will ask you for a pair of "Delimiters" (defaults to "") and will try to mark text near point.

Assume that point is near the dot character.
```js
var t = {s: "one . two"}
```

Then calling textobject-mark-inner with default delimiters will mark `one . two`  
Invoking textobject-mark-outer with `{}` will result in marking `{s: "one . two"}`

*Note that using `electric-pair-mode` one need to enter only the opening brace.*
