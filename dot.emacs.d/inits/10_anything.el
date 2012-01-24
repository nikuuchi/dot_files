



;-------------------------------------------------------------------

;;auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/site-lisp/auto-install/")
;(auto-install-update-emacswiki-package-name t)  ;この行は遅くなるけど,更新は必要なので定期的にやること.
(auto-install-compatibility-setup)             ; 互換性確保
;;anything.el
(defvar org-directory "")
(require 'anything-startup)
;------------------------------------------------------------------
