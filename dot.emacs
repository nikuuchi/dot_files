;;------------------------------------------------------------------------------------
;;Emacsで書く可能性がある言語
;;C,C++,Ruby,CoffeeCcript,OCaml,EmacsLisp
;;------------------------------------------------------------------------------------
;-------------------------------------------------------------------
;; pathの設定
(setq load-path
      (append
       (list
	(expand-file-name "~/.emacs.d/")
	(expand-file-name "~/.emacs.d/site-lisp/")
	(expand-file-name "~/.emacs.d/site-lisp/auto-install/")
	(expand-file-name "~/.emacs.d/site-lisp/color-theme/")
	(expand-file-name "~/.emacs.d/site-lisp/mode/")
	(expand-file-name "~/.emacs.d/site-lisp/ruby/")
	(expand-file-name "~/.emacs.d/site-lisp/rinari/")
	(expand-file-name "~/.rvm/gems/ruby-head/gems/rcodetools-0.8.5.0/")
	(expand-file-name "~/.emacs.d/site-lisp/rsense/")
	(expand-file-name "~/.emacs.d/site-lisp/rsense/etc")
	(expand-file-name "~/.emacs.d/site-lisp/elisp/haml-mode")
	(expand-file-name "~/.emacs.d/site-lisp/elisp/sass-mode")
	(expand-file-name "~/.emacs.d/site-lisp/ensime/src/main/elisp")
	(expand-file-name "~/.emacs.d/site-lisp/coffee-mode")
	(expand-file-name "~/.emacs.d/site-lisp/zencoding")
	(expand-file-name "~/.emacs.d/site-lisp/markdown-mode")
	)
       load-path))
;----------------------------------------------------------
;;version
;; emacs-version predicates
(setq emacs22-p (string-match "^22" emacs-version)
      emacs23-p (string-match "^23" emacs-version)
      emacs23.0-p (string-match "^23\.0" emacs-version)
      emacs23.1-p (string-match "^23\.1" emacs-version)
      emacs23.2-p (string-match "^23\.2" emacs-version))

;;init-loaderを使って.emacsを分割する
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits/") ; 設定ファイルがあるディレクトリを指定
