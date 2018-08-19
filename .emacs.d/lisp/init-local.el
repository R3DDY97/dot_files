;;; package --- summary local config
;;; Commentary:
;;; code:

;; Enable transient mark mode
;; (transient-mark-mode 1)


;;  coustom key shortcuts
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")
(drag-stuff-global-mode t)
(global-set-key (kbd "M-<up>")   #'drag-stuff-up)
(global-set-key (kbd "M-<down>") #'drag-stuff-down)
(global-set-key (kbd "M-<right>") #'drag-stuff-right)
(global-set-key (kbd "M-<left>") #'drag-stuff-left)


;;Save History--------------------------------
;;Save mode-line history between sessions. Very good!
;; (setq savehist-additional-variables    ;; Also save ...
;;       '(search-ring regexp-search-ring)    ;; ... searches
;;       savehist-file "~/.emacs.d/savehist") ;; keep home clean
;; (savehist-mode t)                      ;; do this before evaluation

;; ;; Save point position between sessions
;; (require 'saveplace)
;; (setq-default save-place t)
;; (setq save-place-file (expand-file-name "save-point-places" user-emacs-directory))



(setq
 next-line-add-newlines nil             ;; don't add newlines autom'ly when
 require-final-newline t)               ;; end files with a newline


(file-name-shadow-mode t)                ;; be smart about filenames in mbuf
(setq use-file-dialog nil)               ;; never show the dialog

(setq-default
 cursor-type '(bar . 3)                 ;; normal cursor, a double-"_"
 cursor-in-non-selected-windows 'hollow) ;; hollow cursor when non-selected

;; (scroll-bar-mode -1)
;; (set-fringe-mode '(1 .  1))              ;; emacs 22+
;; (delete-selection-mode t)                ;; delete selection upon keypress
;; (defalias 'yes-or-no-p 'y-or-n-p)     ;;answer "y/n" rather than "yes/no"


;; Python config

;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
;; (add-hook 'elpy-mode-hook 'flycheck-mode)
;; (add-to-list 'company-backends 'company-jedi)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)

;; ;; smex

;; (smex-initialize) ; Can be omitted. This might cause a (minimal) delay when Smex is auto-initialized on its first run.

;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)  ;; This is your old M-x.
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; multiple cursors
(require 'multiple-cursors)

;;Having  an active region that spans multiple lines, the following will add a cursor to each line:
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;;To add multiple cursors not based on continuous lines, but based on keywords in the buffer
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;;To get out of multiple-cursors-mode, press <return> or C-g


;; Rectangular markings-----------------------
;; COOL! C-RET gives rectangular marking for copy/paste, extremely useful for tables.
;; NOTE, second line needed for rectangle
(setq cua-enable-cua-keys nil) ;;only for rectangle, don't use C-x/c/v for copy/paste
(cua-mode t)                   ;;gives rectangle + same as "(pc-selection-mode)" (=shift+arrow highlights)


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


;;Parantes-matching--------------------------
;;Match parenthesis through highlighting rather than retarded jumps. Good!
(when (fboundp 'show-paren-mode)
  (show-paren-mode t)
  (setq show-paren-style 'parenthesis))
;;--------------------------------------------


;;flycheck
;; (use-package flycheck
;;              :ensure t
;;              :init (global-flycheck-mode))
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;;minimap

;; (require 'sublimity)
;; (require 'sublimity-scroll)
;;(require 'sublimity-map) ;; experimental
;; (require 'sublimity-attractive)
;; (sublimity-mode 1)
;;(minimap-mode 1)

;; (setq sublimity-map-size 10)
;; (setq sublimity-map-fraction 0.3)
;; (setq sublimity-map-text-scale -7)


;; (add-hook 'sublimity-map-setup-hook
;;           (lambda ()
;;             (setq buffer-face-mode-face '(:family "monospace"))
;;             (buffer-face-mode)))


;; (setq sublimity-attractive-centering-width 125)

;; (sublimity-attractive-hide-bars)
;; (sublimity-attractive-hide-vertical-border)
;; (sublimity-attractive-hide-fringes)
;; (sublimity-attractive-hide-modelines)

;; (setq sublimity-scroll-weight 10
;;       sublimity-scroll-drift-length 5)


;; (add-hook 'web-mode-hook  'my-web-mode-hook)
;; (setq web-mode-enable-current-element-highlight t)


;; from git

;; (add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
;; (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

;; (when window-system
;;   (global-hl-line-mode))


;;Org mode configuration
;; Enable Org mode
(require 'org)
(add-hook 'message-mode-hook 'turn-on-orgstruct)
(add-hook 'message-mode-hook 'turn-on-orgstruct++)
(add-hook 'org-mode-hook #'org-bullets-mode)
(add-hook 'org-mode-hook #'flyspell-mode)

(setq org-ellipsis "⤵")
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-html-postamble nil)

(setq org-agenda-files
      (file-expand-wildcards "~/Documents/AK0D0/0RG/*.org"))


;;(org-startup-indented)
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))



(add-hook 'before-save-hook 'delete-trailing-whitespace)
(yas-global-mode 1)

(powerline-default-theme)
(powerline-raw mode-line-mule-info nil 'l)

(add-to-list 'load-path "/usr/share/emacs/site-lisp/emms")

(use-package emms
  :config
  (require 'emms-setup)
  (emms-all)
  (emms-default-players)
  (setq emms-source-file-default-directory "~/Music/")
  (setq emms-playlist-buffer-name "*Music*")
  (setq emms-info-asynchronously t)
  (require 'emms-info-libtag) ;;; load functions that will talk to emms-print-metadata which in turn talks to libtag and gets metadata
  (setq emms-info-functions '(emms-info-libtag)) ;;; make sure libtag is the only thing delivering metadata
  (require 'emms-mode-line)
  (emms-mode-line 1)
  (require 'emms-playing-time)
  (emms-playing-time 1))

(setq emms-playlist-default-major-mode 'emms-playlist-mode)



;; (global-set-key (kbd "C-c +") 'emms-volume-mode-plus)
;; (global-set-key (kbd "C-c -") 'emms-volume-mode-minus)



;; (progn
;;   (require 'emms)
;;   (require 'emms-setup)

;;   (emms-all)
;;   (emms-default-players)
;;   (emms-history-load)

;;   (setq emms-player-list '(emms-player-mplayer)
;;         emms-seek-seconds 5
;;         emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find
;;         emms-info-asynchronously t
;;         emms-source-file-default-directory "~/Music/")

;;   ;; EMMS Mode-line
;;   (emms-mode-line nil)  ;; disable minibuffer info
;;   (emms-playing-time nil) ;; disable track progress timing

;; (define-key dired-mode-map "E" 'emms-play-dired)


;; ==================================================
;; PDF-TOOLS
;; ==================================================

(progn
  (require 'pdf-tools)
  (pdf-tools-install) ;; install pdf-tools
  (add-hook 'pdf-tools-enabled-hook 'auto-revert-mode)

  (define-key pdf-view-mode-map (kbd "C-n") 'pdf-view-next-page-command)
  (define-key pdf-view-mode-map (kbd "C-p") 'pdf-view-previous-page-command)
  (define-key pdf-view-mode-map (kbd "n") 'pdf-view-next-line-or-next-page)
  (define-key pdf-view-mode-map (kbd "p") 'pdf-view-previous-line-or-previous-page)

  (setq pdf-annot-activate-created-annotations t ;; automatically annotate highlights
        ;; more fine-grained zooming
        pdf-view-resize-factor 1.1)
  (add-hook 'pdf-view-mode-hook (lambda () (cua-mode 0)))

  ;; __________________________________________________
  ;; Pdf-tools reopen last page
  ;; https://github.com/politza/pdf-tools/issues/18#issuecomment-269515117

  (defun brds/pdf-set-last-viewed-bookmark ()
    (interactive)
    (when (eq major-mode 'pdf-view-mode)
      (bookmark-set (brds/pdf-generate-bookmark-name))))

  (defun brds/pdf-jump-last-viewed-bookmark ()
    (bookmark-set "fake")               ; this is new
    (when
        (brds/pdf-has-last-viewed-bookmark)
      (bookmark-jump (brds/pdf-generate-bookmark-name))))

  (defun brds/pdf-has-last-viewed-bookmark ()
    (assoc
     (brds/pdf-generate-bookmark-name) bookmark-alist))

  (defun brds/pdf-generate-bookmark-name ()
    (concat "PDF-LAST-VIEWED: " (buffer-file-name)))

  (defun brds/pdf-set-all-last-viewed-bookmarks ()
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (brds/pdf-set-last-viewed-bookmark))))

  (add-hook 'kill-buffer-hook 'brds/pdf-set-last-viewed-bookmark)
  (add-hook 'pdf-view-mode-hook 'brds/pdf-jump-last-viewed-bookmark)
  (unless noninteractive                ; as `save-place-mode' does
    (add-hook 'kill-emacs-hook #'brds/pdf-set-all-last-viewed-bookmarks)))


;; elfeed

(global-set-key (kbd "C-x w") 'elfeed)

(setq elfeed-feeds
      '(("https://feeds.feedburner.com/Torrentfreak" Pirate)
        ("http://jvns.ca/atom.xml" BL0G)
        ("https://www.cyberciti.biz/feed/" LINUX)
        ("https://planetpython.org/rss20.xml" Python)))



;; ;; exwm
;; (require 'exwm-randr)
;; (setq exwm-randr-workspace-output-plist '(1 "LVDS-1"))
;; (add-hook 'exwm-randr-screen-change-hook
;;           (lambda ()
;;             (start-process-shell-command
;;              "xrandr" nil "xrandr --output DP-1 --right-of HDMI-1 --auto")))

;; (exwm-randr-enable)
;; (exwm-config-default)
;; (exwm-systemtray-enable)

;;; installed packages = exwm ,emms, unicode-fonts

;; neo-tree
;; themes available classic(default) ascii arrow icons nerd.
;; req neotree, all-the-icons
(global-set-key [f8] 'neotree-toggle)

(setq neo-theme
      (if (display-graphic-p) 'icons 'classic))

(provide 'init-local)



;;; init-local ends here
