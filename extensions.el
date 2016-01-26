;;; extensions.el --- coq Layer extensions File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq coq-pre-extensions
      '(
        proof-general
        ))

(setq coq-post-extensions
      '(
        ;; post extension names go here
        ))

;; For each extension, define a function coq/init-<extension-name>
;;
;; (defun coq/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun coq/init-proof-general ()
  "Initialize Proof General"
  (use-package proof-site
    :defer t
    :mode ("\\.v\\'" . coq-mode)
    :load-path
    "/usr/local/Cellar/proof-general/4.2/share/emacs/site-lisp/proof-general/generic")
  :config (progn
            (evil-leader/set-key-for-mode 'coq-mode
              "n" 'proof-assert-next-command-interactive))
  )
