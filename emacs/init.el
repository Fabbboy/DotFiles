(setq inhibit-startup-message t)
(setq warning-minimum-level :emergency)

(windmove-default-keybindings)

(setq c-basic-offset 2)
(setq-default indent-tabs-mode nil)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(global-unset-key (kbd "C-x t"))
(global-set-key (kbd "C-t") tab-prefix-map)

(defadvice align-regexp (around align-regexp-with-spaces activate)
  (let ((indent-tabs-mode nil))
    ad-do-it))

(defun backup-dir (dir)
  `(("" . ,(expand-file-name (concat user-emacs-directory dir)))))

(setq backup-directory-alist (backup-dir "backup/per-save"))
(defun force-backup-of-buffer ()
  (when (not buffer-backed-up)
    (let ((backup-directory-alist (backup-dir "backup/per-session"))
          (kept-new-versions 3))
      (backup-buffer)))
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook 'force-backup-of-buffer)

(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name (concat user-emacs-directory "autosaves")) t)))

(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      backup-by-copying t
      vc-make-backup-files t)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(require 'package)

(defmacro append-to-list (target suffix)
  `(setq ,target (append ,target ,suffix)))

(append-to-list
 package-archives
 '(("melpa" . "http://melpa.org/packages/")
   ("melpa-stable" . "https://stable.melpa.org/packages/")
   ("org-elpa" . "https://orgmode.org/elpa/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t
      use-package-verbose t)

(unless (eq system-type 'windows-nt)
  (use-package exec-path-from-shell
    :config (exec-path-from-shell-initialize)))

(setq inhibit-splash-screen t)

(use-package doom-themes
  :init (load-theme 'doom-one))

(use-package ivy
  :init (ivy-mode 1)
  (setq ivy-height 15
        ivy-use-virtual-buffers t
        ivy-use-selectable-prompt t))

(use-package counsel
  :after ivy
  :init (counsel-mode 1))

(use-package magit)
(use-package forge :after magit)

(unless (package-installed-p 'eglot-booster)
  (package-vc-install "https://github.com/jdtsmith/eglot-booster.git"))

(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode) . ("clangd" "--background-index" "--clang-tidy"))))

(add-hook 'c-mode-common-hook 'eglot-ensure)

(use-package clang-format
  :ensure t)

(use-package eglot-booster
  :after eglot
  :config (eglot-booster-mode))

(use-package eldoc-box
  :config
  (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-mode t)
  (eldoc-box-hover-at-point-mode))

(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 0
        company-idle-delay 0.01
        company-dabbrev-downcase 0
        company-format-margin-function 'company-dot-icons-margin
        company-frontends '(company-pseudo-tooltip-frontend
                            company-echo-metadata-frontend))
  :bind (:map company-active-map
              ("<TAB>" . nil)
              ([tab] . nil)
              ("C-y" . company-complete-selection)))

(with-eval-after-load 'eglot
  (add-to-list 'company-backends 'company-capf))

(use-package copilot
  :ensure t
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
         ("<tab>" . copilot-accept-completion)
         ("TAB" . copilot-accept-completion)
         ("C-<tab>" . copilot-accept-completion-by-word)))
