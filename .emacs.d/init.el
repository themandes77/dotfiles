;; relative line numbers  -*- lexical-binding: t; -*-
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; Dark theme
(load-theme 'ancient-one-dark t)

;; Hide toolbar
(tool-bar-mode -1)

;; Hide menu bar
(menu-bar-mode -1)

;; Which Key mode
(which-key-mode 1)
(setq which-key-idle-delay 0.5)
(setq which-key-popup-type 'side-window)

;; Hide scroll bar
(scroll-bar-mode -1)

;; Font
(set-face-attribute 'default nil
		    :family "IosevkaTermSlab Nerd Font"
		    :height 120)

;; Disable bell
(setq ring-bell-function 'ignore)

;; Package repos
(require 'package)

(setq package-archives
      '(("gnu"    . "https://epla.gnu.org/packages/")
	("nongnu" . "https://elpa.nongnu.org/nongnu/")
	("melpa"  . "https://melpa.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Automatically install packages if missing

(unless (package-installed-p 'evil) ;; Evil mode
  (package-refresh-contents)
  (package-install 'evil))

(with-eval-after-load 'evil
  (evil-define-key 'normal dashboard-mode-map
    (kbd "r") #'dashboard-jump-to-recents
    (kbd "p") #'dashboard-jump-to-projects
    (kbd "g") #'dashboard-refresh-buffer))

(setq project-vc-extra-root-markers '(".project"))

(unless (package-installed-p 'ivy) ;; Ivy mode
  (unless package-archive-contents
    (package-refresh-contents))
  (package-install 'ivy))

(unless (package-installed-p 'counsel) ;; Counsel
  (unless package-archive-contents
    (package-refresh-contents))
  (package-install 'counsel))

(unless (package-installed-p 'nerd-icons) ;; Nerd icons
  (unless package-archive-contents
    (package-refresh-contents))
  (package-install 'nerd-icons))
(unless (package-installed-p 'nerd-icons-dired) ;; Nerd icons dired
  (package-install 'nerd-icons-dired))

(require 'nerd-icons)
(require 'nerd-icons-dired)

(add-hook 'dired-mode-hook #'nerd-icons-dired-mode)
;; counsel
(require 'counsel)

(global-set-key (kbd "M-x") #'counsel-M-x)
(global-set-key (kbd "C-x C-f") #'counsel-find-file)
(global-set-key (kbd "C-x b") #'counsel-switch-buffer)

;; Enable ivy
(require 'ivy)
(ivy-mode 1)

(setq ivy-use-virtual-buffers t
      ivy-count-format "(%d/%d) "
      enable-recursive-minibuffers t)
(setq ivy-height 12)

;; Enable Vim keybindings
(require 'evil)
(evil-mode 1)

(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

;; LSP support using built-in Eglot
(require 'eglot)

;; LSP: Eglot
(add-to-list 'eglot-server-programs
	     '(python-mode
	       . ("pyright-langserver" "--stdio")))
(require 'lua-mode)
(define-derived-mode luau-mode lua-mode "Luau"
  "Major mode for Roblox luau.")

(add-to-list 'auto-mode-alist '("\\.luau\\'" . luau-mode))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(lua-mode . ("lua-language-server")))
  (add-to-list 'eglot-server-programs
	           '(luau-mode . ("luau-lsp" "lsp")))
  (add-to-list 'eglot-server-programs
               '(c-mode . ("clangd")))
  (add-to-list 'eglot-server-programs
               '(c++-mode . ("clangd"))))


(require 'rust-mode)

(add-hook 'c-mode-hook
          (lambda ()
            (setq-local c-basic-offset 4
                        tab-width 4
                        indent-tabs-mode nil)))

;; Start Eglot automatically
(add-hook 'rust-mode-hook #'eglot-ensure)
(add-hook 'luau-mode-hook #'eglot-ensure)
(add-hook 'lua-mode-hook #'eglot-ensure)
(add-hook 'python-mode-hook #'eglot-ensure)
(add-hook 'c++-mode #'eglot-ensure)
(add-hook 'js-mode-hook #'eglot-ensure)
(add-hook 'typescropt-mode-hook #'eglot-ensure)
(add-hook 'rust-mode-hook #'eglot-ensure)
(add-hook 'c-mode-hook #'eglot-ensure)

;; Built-in completion
(setq tab-always-indent 'complete)
(setq completion-cycle-threshold 3)

;; Disable backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Set shell

(setenv "SHELL" "/bin/zsh")
(setq shell-file-name (executable-find "zsh"))
(setq explicit-shell-file-name (executable-find "zsh"))

(setq shell-command-switch "-c")

;; Welcome screen
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Tabs
(setq-default tab-width 4
			  standard-indent 4
			  indent-tabs-mode nil)

;; Org headings
(add-hook 'org-mode-hook #'org-indent-mode)

;; Improve spacing
(add-hook 'org-mode-hook
		  (lambda ()
			(setq-local line-spacing 0.15)))

;; Org modern
(unless (package-installed-p 'org-modern)
  (unless package-archive-contents
	(package-refresh-contents))
  (package-install 'org-modern))
(require 'org-modern)

;;(add-hook 'org-mode-hook #'org-modern-mode)

;; Modern Org appearance
(use-package org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-star '("◉" "○" "✸" "✿" "◆" "▶")
        org-modern-list '((43 . "➤")
                          (45 . "–")
                          (42 . "•"))
        org-modern-table-vertical 1
        org-modern-table-horizontal 0.2
        org-modern-todo-faces
        '(("TODO" :inverse-video t :inherit org-todo)
          ("DONE" :inverse-video t :inherit org-done)
          ("WAIT" :inverse-video t :inherit warning)
          ("HOLD" :inverse-video t :inherit warning))
        org-modern-block-name
        '((t . t)
          ("src" "»" "«")
          ("quote" "❝" "❞"))
        org-modern-horizontal-rule
        (make-string 36 ?─)))

;; Reveal markup when editing
(use-package org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autoemphasis t
        org-appear-autosubmarkers t
        org-appear-autolinks t))

;; Org appearance
(with-eval-after-load 'org
  (setq org-hide-emphasis-markers t
        org-pretty-entities t
        org-startup-indented t
        org-ellipsis " ▾"))

(setq org-ellipsis "…")

(with-eval-after-load 'org
  (evil-define-key 'normal org-mode-map
    (kbd "TAB") #'org-cycle))

;; Corfu
(require 'corfu)

(global-corfu-mode 1)

(setq corfu-auto t
	  corfu-auto-delay 0.2
	  corfu-auto-prefix 1
	  corfu-cycle t
	  corfu-preselect 'prompt)

;; Dashboard
(require 'dashboard)

(setq dashboard-banner-logo-title "Welcome to Emacs!"
      dashboard-startup-banner 'logo
      dashboard-center-content t
      dashboard-vertically-center-content t)

(setq dashboard-items
      '((recents . 5)
        (projects . 5)
        (bookmarks . 5)))

(dashboard-setup-startup-hook)

(setq dashboard-icon-type 'nerd-icons)

;; Configure selene

(defun my/selene-flymake (report-fn &rest _args)
  (when buffer-file-name
    (let ((file buffer-file-name)
          (source (current-buffer)))
      (make-process
       :name "selene"
       :buffer (generate-new-buffer " *selene*")
       :command (list "selene" file "--display-style" "Json")
       :sentinel
       (lambda (proc _event)
         (when (memq (process-status proc) '(exit signal))
           (kill-buffer (process-buffer proc))))))))

;; Clipboard stuff

(global-set-key (kbd "C-S-v") #'clipboard-yank)

(with-eval-after-load 'evil
  (define-key evil-insert-state-map (kbd "C-S-v") #'clipboard-yank)
  (define-key evil-normal-state-map (kbd "C-S-v") #'clipboard-yank))

(setq select-enable-clipboard t
      select-enable-primary t)

;; Open my notes
(defvar my/org-notes-file
  (expand-file-name "~/Notes/notes.org"))
(defun my/open-notes ()
  (interactive)
  (find-file my/org-notes-file))

;; Keybindings

(evil-set-leader 'normal (kbd "SPC"))
(evil-define-key 'normal 'global
  (kbd "SPC w w") #'my/open-notes
  (kbd "SPC f f") #'dired
  (kbd "SPC b i") #'ibuffer)
