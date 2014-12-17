;;; pakcage --- summary
;;; Code:
;;; Commentary:

;;;(set-frame-font "DejaVu Sans Mono-13" nil t)

(defun my-local-config ()
  "My local configurations."
  (local-set-key (kbd "RET") 'newline-and-indent)
  (setq tab-width 2)
  (setq c-basic-offset 2)
  (setq evil-shift-width 2)
  (setq indent-tabs-mode nil)
  (blink-cursor-mode 0)
  (setq python-indent 2))


(defun etags-build-load (dir maxdepth extension)
  "Build and reload etags files."
  (interactive "DDirectory: \nnMaxdepth: \nsExtension: ")
  (let ((tags-file (format "%s/TAGS" dir))
        (etags-cmd "find %s -maxdepth %d -name \"*.%s\" -exec ctags -e -a -f %s {} \\;"))
    (if (file-exists-p tags-file)
        (delete-file tags-file))
    (eshell-command (format etags-cmd dir maxdepth extension tags-file))
    (visit-tags-table tags-file)))

(defun etags-load (dir)
  "Load the etags files."
  (interactive "DDirectory: ")
  (let ((tags-file (format "%s/TAGS" dir)))
    (visit-tags-table tags-file)))

(add-hook 'prog-mode-hook 'my-local-config)
(add-hook 'prog-mode-hook
          (lambda ()
            (define-key evil-normal-state-map (kbd "C-x e b") 'etags-build-load)
            (define-key evil-normal-state-map (kbd "C-x e l") 'etags-load)))
(provide 'init-local)
;;; init-local.el ends here
