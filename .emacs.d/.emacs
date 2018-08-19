
(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
(not (gnutls-available-p))))
(proto (if no-ssl "http" "https")))
;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
;; (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)

(when (< emacs-major-version 24)
;; For important compatibility libraries like cl-lib
(add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(elpy-enable)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(global-ede-mode t)
 '(package-selected-packages
   (quote
    (markdown-mode markdown-mode+ markdown-preview-mode org-bullets org-autolist org-mime org-beautify-theme company-jedi diff-hl flatui-dark-theme html-to-markdown yaml-mode impatient-mode web-mode-edit-element company-shell jinja2-mode json-navigator jedi html5-schema json-mode js2-mode deft sublimity flycheck-pycheckers flycheck fontawesome jedi-core python-x python-mode smex projectile web-mode anaconda-mode autopair drag-stuff rust-mode org-edna)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 120 :width normal)))))



;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)


;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)

(add-hook 'message-mode-hook 'turn-on-orgstruct)
(add-hook 'message-mode-hook 'turn-on-orgstruct++)
;;(org-startup-indented)

(setq org-todo-keywords
'((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))



;; Rust config

;; (add-hook 'rust-mode-hook 'cargo-minor-mode)
;; (add-hook 'rust-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))


    (defun indent-buffer ()
    "Indent current buffer according to major mode."
    (interactive)
    (indent-region (point-min) (point-max)))



    (setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
    (setq racer-rust-src-path "/home/venky/Documents/Programming/Rust/rust/src/") ;; Rust source code PATH

    (add-hook 'rust-mode-hook #'racer-mode)
    (add-hook 'racer-mode-hook #'eldoc-mode)
    (add-hook 'racer-mode-hook #'company-mode)
    (add-hook 'rust-mode-hook 'drag-stuff-mode)
    (add-hook 'after-init-hook 'global-company-mode)



    ;; coustom key shortcuts

    (global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")
    (drag-stuff-global-mode t)
    (global-set-key (kbd "M-<up>")   #'drag-stuff-up)
    (global-set-key (kbd "M-<down>") #'drag-stuff-down)
    (global-set-key (kbd "M-<right>")   #'drag-stuff-right)
    (global-set-key (kbd "M-<left>") #'drag-stuff-left)



    ;;Save History--------------------------------
    ;;Save mode-line history between sessions. Very good!
    (setq savehist-additional-variables    ;; Also save ...
    '(search-ring regexp-search-ring)    ;; ... searches
    savehist-file "~/.emacs.d/savehist") ;; keep home clean
    (savehist-mode t)                      ;; do this before evaluation
    ;;--------------------------------------------

    ;; (jinja2-mode 1)

    ;; Save point position between sessions
    (require 'saveplace)
    (setq-default save-place t)
    (setq save-place-file (expand-file-name "save-point-places" user-emacs-directory))




    ;; general settings
    (menu-bar-mode -1)                       ;; show the menu...
    (display-time-mode -1)                   ;; don't need time
    (tool-bar-mode -1)
    (blink-cursor-mode 0)
    (autopair-global-mode)


    (setq
    next-line-add-newlines nil             ;; don't add newlines autom'ly when
    require-final-newline t)               ;; end files with a newline
    
    (file-name-shadow-mode t)                ;; be smart about filenames in mbuf
    (setq use-file-dialog nil)               ;; never show the dialog

    (setq-default
    cursor-type '(bar . 3)                 ;; normal cursor, a double-"_"
    cursor-in-non-selected-windows 'hollow) ;; hollow cursor when non-selected

    (scroll-bar-mode -1)
    (set-fringe-mode '(1 .  1))              ;; emacs 22+
    (delete-selection-mode t)                ;; delete selection upon keypress
    (defalias 'yes-or-no-p 'y-or-n-p)     ;;answer "y/n" rather than "yes/no"


;; Python config

    (require 'py-autopep8)
    (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
    (add-hook 'elpy-mode-hook 'flycheck-mode)
    (add-to-list 'company-backends 'company-jedi)
    (add-hook 'python-mode-hook 'jedi:setup)
    (setq jedi:complete-on-dot t)

    ;; ;; smex

    ;; (smex-initialize) ; Can be omitted. This might cause a (minimal) delay when Smex is auto-initialized on its first run.

    ;; (global-set-key (kbd "M-x") 'smex)
    ;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)  ;; This is your old M-x.
    ;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


    ;; font size
    (global-set-key (kbd "C-+") 'text-scale-increase)
    (global-set-key (kbd "C--") 'text-scale-decrease)


    ;; ;; multiple cursors
    (require 'multiple-cursors)

    ;;Having  an active region that spans multiple lines, the following will add a cursor to each line:
    (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

    ;;To add multiple cursors not based on continuous lines, but based on keywords in the buffer
    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
    ;;To get out of multiple-cursors-mode, press <return> or C-g


    ;;Rectangular markings-----------------------
    ;;COOL! C-RET gives rectangular marking for copy/paste, extremely useful
    ;;for tables. NOTE, second line needed for rectangle, but also gives
    ;; (transient-mark-mode t) = visualize C-SPC-marking (i.e. highlight)
    (setq cua-enable-cua-keys nil) ;;only for rectangle, don't use C-x/c/v for copy/paste
    (cua-mode t)                   ;;gives rectangle + same as "(pc-selection-mode)" (=shift+arrow highlights)
    ;;--------------------------------------------

    ;;(volatile-highlights-mode t)


    ;;Awesome copy/paste!----------------------
    ;;My most used hack! If nothing is marked/highlighted, and you copy or cut
    ;;(C-w or M-w) then use column 1 to end. No need to "C-a C-k" or "C-a C-w" etc.
    (defadvice kill-ring-save (before slick-copy activate compile)
    "When called  interactively with no active region, copy a single line instead."
    (interactive
    (if mark-active (list (region-beginning) (region-end))
    (message "Copied line")
    (list (line-beginning-position)
    (line-beginning-position 2)))))

    (defadvice kill-region (before slick-cut activate compile)
    "When called interactively with no active region, kill a single line instead."
    (interactive
    (if mark-active (list (region-beginning) (region-end))
    (list (line-beginning-position)
    (line-beginning-position 2)))))
    ;;--------------------------------------------




    ;;Parantes-matchning--------------------------
    ;;Match parenthesis through highlighting rather than retarded jumps. Good!
    (when (fboundp 'show-paren-mode)
    (show-paren-mode t)
    (setq show-paren-style 'parenthesis))
    ;;--------------------------------------------


    ;;markdown-mode

    (autoload 'gfm-mode "markdown-mode"
    "Major mode for editing Markdown files" t)
    (add-to-list 'auto-mode-alist '("\\.text\\'" . gfm-mode))
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
    (add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))


    ;;flycheck
    (use-package flycheck
    :ensure t
    :init (global-flycheck-mode))
    (add-hook 'after-init-hook #'global-flycheck-mode)


    ;;minimap
    (require 'sublimity)
    (require 'sublimity-scroll)
    ;;(require 'sublimity-map) ;; experimental
    (require 'sublimity-attractive)
    (sublimity-mode 1)
    ;(minimap-mode 1)

    (setq sublimity-scroll-weight 10
    sublimity-scroll-drift-length 5)


    ;; (setq sublimity-map-size 10)
    ;; (setq sublimity-map-fraction 0.3)
    ;; (setq sublimity-map-text-scale -7)


    ;; (add-hook 'sublimity-map-setup-hook
    ;;           (lambda ()
    ;;             (setq buffer-face-mode-face '(:family "Monospace"))
    ;;             (buffer-face-mode)))


    (setq sublimity-attractive-centering-width 125)

    (sublimity-attractive-hide-bars)
    (sublimity-attractive-hide-vertical-border)
    (sublimity-attractive-hide-fringes)
    ;; (sublimity-attractive-hide-modelines)


    ;; save mode
    (savehist-mode 1)

    ;; web-mode
    (require 'web-mode)
    (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

    
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
(setq web-mode-enable-current-element-highlight t)


;; from git

(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

(when window-system
  (global-hl-line-mode))




(add-hook 'web-mode-hook
          (lambda ()
            (rainbow-mode)
            (rspec-mode)
            (setq web-mode-markup-indent-offset 2)))




;; org conf

(use-package org-bullets
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))

(add-hook 'org-mode-hook #'flyspell-mode)

(setq org-ellipsis "⤵")
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-html-postamble nil)





;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "firefox")

;; (setenv "BROWSER" "firefox")


;; (add-hook 'after-init-hook 'global-company-mode)

;; (save-place-mode t)

;; (projectile-global-mode)
