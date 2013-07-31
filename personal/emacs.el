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
(setq linum-format "%3d\u2502")

;; fringe
'(fringe-mode (quote (2 . 8)) nil (fringe))

;; flymake indicators
;; each integer represents a row of pixels
;; the bits represent the pixel in a row
;; 
;; 0 0 0 0 0 0 0 0 0
;; 0 0 0 0 0 0 0 0 0
;; 0 0 0 0 0 0 0 0 0
;; 1 1 1 1 1 1 1 1 1
;; 1 1 1 1 1 1 1 1 1
;; 0 0 0 0 0 0 0 0 0
;; 0 0 0 0 0 0 0 0 0
;; 0 0 0 0 0 0 0 0 0
;;
;; is a horizontal bar
(define-fringe-bitmap 'flycheck-fringe-exclamation-mark
  [192 192 192 192 192 192 192 192] nil nil 'center)
(define-fringe-bitmap 'question-mark
  [0 0 0 192 192 0 0 0] nil nil 'center)
