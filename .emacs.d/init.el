;; MELPA Package Support

;; enables basic packaging support
(require 'package)

;; adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)


;; initializes the package infrastructure

(package-initialize)

;; if there are no archived package contents, refresh them

(when (not package-archive-contents)
  (package-refresh-contents))

;; install packages
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    elpy                            ;; Emacs Lisp Python Environment
    flycheck                        ;; On the fly syntax checking
    py-autopep8                     ;; Run autopep8 on save
    blacken                         ;; Black formatting on save
    neotree
    spacemacs-theme
    slime
    clojure-mode
    rainbow-delimiters
    cider
    haskell-mode
    tablist
    let-alist
    pdf-tools
    )
  )

;; loop through packages and install
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; enable elpy
(elpy-enable)

;; enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; tabs
(setq tab-width 4)
(setq indent-tabs-mode nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default))
 '(package-selected-packages
   '(rainbow-delimiters clojure-mode blacken flycheck elpy better-defaults py-autopep8 column-enforce-mode exwm pdf-tools slime magit neotree)))

;; get rid of the toolbar and scrollbar bullshit
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)

;; enable ido mode
(require 'ido)
(ido-mode t)

(set-face-attribute 'default nil :height 110)

;; theme
(load-theme 'spacemacs-dark t)

;; enable neotree 
(require 'neotree)

(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; set f9 as neotree toggle
(global-set-key [f9] 'neotree-toggle)

(setq backup-directory-alist
      `(("." . "~/.emacstmp")))

(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))
(pdf-loader-install)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
