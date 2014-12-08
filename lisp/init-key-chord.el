;;; Pakcage --- Summary
;;; Commentary
;;; Code

(require-package 'key-chord)
(require 'key-chord)

(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-visual-state-map  "jk" 'evil-normal-state)

(provide 'init-key-chord)
;;; init-key-chord.el ends here
