;; smaller custom config additional to prelude and main files

;; solarized colors
(load-theme 'solarized-dark t)

;; auto complete
(require 'auto-complete-config)
(ac-config-default)

;; rainbow delimiters
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; enable line numbers
(global-linum-mode t)
(setq linum-format "%4d \u2502")
