;; smaller custom config additional to prelude and main files

;; Set Frame width/height
(defun arrange-frame (w h x y)
  "Set the width, height, and x/y position of the current frame"
  (let ((frame (selected-frame)))
    (delete-other-windows)
    (set-frame-position frame x y)
    (set-frame-size frame w h)))

;; solarized colors
(load-theme 'solarized-dark t)

;; add marmalade
(add-to-list
 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; remove doc checks on elisp files
(eval-after-load
    'flycheck '(setq flycheck-checkers
                     (delq 'emacs-lisp-checkdoc flycheck-checkers)))
;; auto complete
(require 'auto-complete-config)
(ac-config-default)

;; rainbow delimiters
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; enable line numbers
(global-linum-mode t)
(setq linum-format "%3d\u2502")

;; evil!
(evil-mode 1)
;; disable key chords - they dont play well with evil
(key-chord-mode -1)
;; change mode-line color by evil state
(lexical-let ((default-color (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook
            (lambda ()
              (let ((color (cond ((minibufferp) default-color)
                                 ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                                 ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                                 ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                                 (t default-color))))
                (set-face-background 'mode-line (car color))
                (set-face-foreground 'mode-line (cdr color))))))

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

;; google C/C++ style
(add-hook 'c-mode-common-hook 'google-set-c-style)

(arrange-frame 165 55 5 5)

(require 'workgroups2)
;; change workgroups2 settings here
(workgroups-mode 1)        ; put this one at the bottom of .emacs
