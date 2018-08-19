;;; package --- summary lsp config
;;; Commentary:
;;; code:



(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
(add-hook 'elpy-mode-hook 'flycheck-mode)


(require 'lsp-imenu)
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)


(use-package company-lsp
  :config
  (push 'company-lsp company-backends))





(provide 'init-lsp)

;;; init-lsp ends here
