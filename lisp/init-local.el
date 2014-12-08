;;; pakcage --- summary
;;; Code:
;;; Commentary:

(set-frame-font "DejaVu Sans Mono-13" nil t)

(defun my-local-config ()
  (local-set-key (kbd "RET") 'newline-and-indent)
  (setq tab-width 2)
  (setq c-basic-offset 2)
  (setq evil-shift-width 2)
  (setq indent-tabs-mode nil)
  (blink-cursor-mode 0)
  (setq python-indent 2))

(add-hook 'prog-mode-hook 'my-local-config)

(provide 'init-local)
;;; init-local.el ends here
