;; add marmalade
(add-to-list
 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; additional packages to autoinstall by prelude
(prelude-require-packages '(
       rainbow-delimiters
       color-theme-solarized
       auto-complete
       htmlize
       workgroups2
       evil
       evil-nerd-commenter
       elisp-cache
       go-mode
       go-autocomplete
       go-direx
       protobuf-mode
       yasnippet-bundle
       golden-ratio
       emmet-mode
       ac-emmet
       ))
