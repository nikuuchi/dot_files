(require 'yasnippet)

;; トリガはSPC, 次の候補への移動はTAB
(setq yas/trigger-key (kbd "SPC"))
(setq yas/next-field-key (kbd "TAB"))

;; ポップアップを dropdown-list にする
(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt))
(setq yas/text-popup-function #'yas/dropdown-list-popup-for-template)
;; コメントやリテラルではスニペットを展開しない
(setq yas/buffer-local-condition
      '(or (not (or (string= "font-lock-comment-face"
                             (get-char-property (point) 'face))
                    (string= "font-lock-string-face"
                             (get-char-property (point) 'face))))
           '(require-snippet-condition . force-in-comment)))

(yas/load-directory "~/.emacs.d/site-lisp/snippets")
(yas/initialize)
(yas/load-directory "~/.emacs.d/site-lisp/snippets")

