;;; package --- summary
;;; Commentary:
;;; Code:
(require-package 'evil)
(require-package 'key-chord)
(require 'key-chord)

(evil-mode 1)
(define-key evil-normal-state-map  (kbd "<SPC> h") 'windmove-left)
(define-key evil-normal-state-map  (kbd "<SPC> j") 'windmove-down)
(define-key evil-normal-state-map  (kbd "<SPC> k") 'windmove-up)
(define-key evil-normal-state-map  (kbd "<SPC> l") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "M-.") 'find-tag)
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

(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-visual-state-map  "jk" 'evil-normal-state)

(provide 'init-evil)
;;; init-evil.el ends here
