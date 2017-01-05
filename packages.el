;;; packages.el --- coq Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Olivier Verdier <olivier.verdier@gmail.com>
;; URL: https://github.com/olivierverdier/spacemacs-coq
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq coq-packages
    '(
      company-coq
      (proof-general :location local)
      ))

;; List of packages to exclude.
(setq coq-excluded-packages '())

;; For each package, define a function coq/init-<package-name>
;;
;; (defun coq/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun coq/init-company-coq ()
  "Enter company-coq-mode upon entering coq-mode."
  (use-package company-coq
    :defer t
    :init
    (add-hook 'coq-mode-hook #'company-coq-mode)))

(defun coq/init-proof-general ()
  "Initialize Proof General."
  ;; Setup from Proof General README, using a path from the configuration. Proof General
  ;; lazily loads from proof-site, so there's no need to use-package it.
  (load proof-general-path)
  (spacemacs/set-leader-keys-for-major-mode 'coq-mode
    "n" 'proof-assert-next-command-interactive
    "u" 'proof-undo-last-successful-command
    "h" 'company-coq-doc
    "l" 'proof-layout-windows
    "p" 'proof-prf
    "x" 'proof-shell-exit
    (or dotspacemacs-major-mode-leader-key ",") 'proof-goto-point
    )
  )
