(require-package 'etags-select)

(defun my-ido-find-tag ()
  "Find a tag using ido"
  (interactive)
  (tags-completion-table)
  (let (tag-names)
    (mapatoms (lambda (x) (push (prin1-to-string x t) tag-names))
              tags-completion-table)
    (etags-select-find (ido-completing-read "Tag: " tag-names))))

(add-hook 'prog-mode-hook
          (lambda ()
            (print "Prog-mode-hook lambda invoked")
            (define-key (current-global-map) (kbd "M-?") 'my-ido-find-tag)
            (define-key (current-global-map) (kbd "M-.") nil)
            (define-key evil-normal-state-map (kbd "M-.") nil)
            (define-key evil-normal-state-map (kbd "M-.") 'etags-select-find-tag)
            (define-key (current-global-map) (kbd "M-.") 'etags-select-find-tag)))

(provide 'init-etags-select)
;;; init-etags-select.el ends here
