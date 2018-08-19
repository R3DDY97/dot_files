;;; package --- summary python config
;;; Commentary:
;;; code:


(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))
(elpy-enable)

(require-package 'pip-requirements)


(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "-i --simple-prompt")

;;use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
 (add-hook 'elpy-mode-hook 'flycheck-mode))


(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'elpy-mode-hook 'flycheck-mode)
(add-to-list 'company-backends 'company-jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'whitespace-cleanup-mode)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;; (when (maybe-require-package 'anaconda-mode)
;;   (after-load 'python
;;     (add-hook 'python-mode-hook 'anaconda-mode)
;;     (add-hook 'python-mode-hook 'flycheck-mode)
;;     (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
;;   (when (maybe-require-package 'company-anaconda)
;;     (after-load 'company
;;       (add-hook 'python-mode-hook
;;                 (lambda () (sanityinc/local-push-company-backend 'company-anaconda))))))

(provide 'init-python)


;;; init-python ends here
