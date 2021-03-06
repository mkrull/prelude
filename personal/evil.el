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

(eval-after-load "evil"
  '(progn
     ;; Navigation in autocomplete menues gets hijacked by evil
     (define-key ac-completing-map (kbd "C-n") 'ac-next)
     (define-key ac-completing-map (kbd "C-p") 'ac-previous)
     ;; Let me stop autocompleting the emacs/evil way
     (define-key ac-completing-map (kbd "C-g") 'ac-stop)
     (define-key ac-completing-map (kbd "ESC") 'evil-normal-state)
     (evil-make-intercept-map ac-completing-map)))

;; nerd commenter default key bindings
(evilnc-default-hotkeys)
