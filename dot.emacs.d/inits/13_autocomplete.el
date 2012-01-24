
;;auto-complete
(require 'auto-complete)
;(require 'auto-complete-yasnippet)
(global-auto-complete-mode t)


(setq rsense-home (expand-file-name "~/rsense-0.3/"))
(require 'rsense)

;(add-hook 'ruby-mode-hook
;          '(lambda ()
             ;; .や::を入力直後から補完開始
;             (add-to-list 'ac-sources 'ac-source-rsense-method)
;             (add-to-list 'ac-sources 'ac-source-rsense-constant)
             ;; C-x .で補完出来るようキーを設定
;             (define-key ruby-mode-map (kbd "C-x .") 'ac-complete-rsense)))
