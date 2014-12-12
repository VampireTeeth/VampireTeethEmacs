;;; package --- summary
;;; Commentary:
;;; Code:
(require-package 'ac-etags)

(custom-set-variables
 '(ac-etags-requires 1))

(eval-after-load "etags"
  '(progn (ac-etags-setup)))

(add-hook 'c-mode-common-hook 'ac-etags-ac-setup)
(add-hook 'ruby-mode-common-hook 'ac-etags-ac-setup)
(add-hook 'php-mode-common-hook 'ac-etags-ac-setup)


(provide 'init-ac-etags)
;;; init-ac-etags.el ends here
