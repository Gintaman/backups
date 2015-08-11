(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(tool-bar-mode -1)
(menu-bar-mode -99)

(setq package-enable-at-startup nil)
(package-initialize)

;;(add-to-list 'load-path "~/.emacs.d/powerline")
;;(require 'powerline)
;;(powerline-center-evil-theme)
;;(powerline-evil-vim-color-theme)

;;backups saved in ~/.saves
(setq backup-directory-alist `(("." . "~/.saves")))

(global-linum-mode 1)
(electric-pair-mode 1)
;;adjust spacing
(setq linum-format "%-d ")

(defun ensure-package-installed (&rest packages)
    "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
    (mapcar
     (lambda (package)
       (if (package-installed-p package)
	   nil
	 (if (y-or-n-p (format "Package %s is missing. Install it? " package))
	     (package-install package)
	   package)))
     packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Assuming you wish to install "iedit" and "magit"
(ensure-package-installed 'iedit 'magit)

;;change windows
(global-set-key (kbd "M-p") 'ace-window)

(require 'evil)
(define-key evil-motion-state-map (kbd ";") 'evil-ex)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)
(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("5d1434865473463d79ee0523c1ae60ecb731ab8d134a2e6f25c17a2b497dd459" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(load-theme 'gruvbox 1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme.el/")
(add-to-list 'load-path "~/.emacs.d/moe-theme.el/")
(require 'moe-theme)
(moe-dark)
(powerline-moe-theme)


(setq evil-shift-width 4)
(setq js-indent-level 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-width 4)
(setq-default tab-always-indent t)
(setq indent-line-function 'insert-tab)

(add-hook 'sgml-mode-hook 'emmet-mode)

(add-hook 'html-mode-hook
          (lambda()
            (set (make-local-variable 'sgml-basic-offset) 4)))
