;; smaller custom config additional to prelude and main files

;; Set Frame width/height
(defun arrange-frame (w h x y)
  "Set the width, height, and x/y position of the current frame"
  (let ((frame (selected-frame)))
    (delete-other-windows)
    (set-frame-position frame x y)
    (set-frame-size frame w h)))

;; solarized colors
(if window-system
    (load-theme 'solarized-dark t)
)

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

;; custom key bindings
;; create custom prefix command and keys
(define-prefix-command 'custom-keymap)
(global-unset-key "\C-c\C-p")
(global-set-key (kbd "\C-c\C-p") 'custom-keymap)
(define-key custom-keymap (kbd "b k") 'kill-buffer-and-window)
(define-key custom-keymap (kbd "l p") 'list-packages)

;; display time in the modeline for fullscreen convenience
(setq display-time-string-forms
      '((propertize (concat " " 24-hours ":" minutes " ")
                    'face 'bold)))
(display-time-mode 1)

;; set k&r default style for C
(setq c-default-style "k&r")

;; run workgroups only with window system
(require 'workgroups2)
(if window-system
    ;; change workgroups2 settings here
    (workgroups-mode 1)        ; put this one at the bottom of .emacs
)
