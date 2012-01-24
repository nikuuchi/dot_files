
;; ruby-electric.el
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; ruby-block.el
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;;snippet
(global-set-key "\M-e" 'yas/expand)

;; flymake-ruby
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
          (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))
 
(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
 
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)
 
(add-hook 'ruby-mode-hook
          '(lambda ()
 
             ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
             (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
                 (flymake-mode t))
             ))

 (when (require 'auto-complete nil t)
   (global-auto-complete-mode t)
   (setq ac-dwim nil)
   (setq ac-auto-start t)
   (global-set-key "\M-/" 'ac-start)
   (setq ac-sources '(ac-source-abbrev ac-source-words-in-buffer))
   (add-hook 'ruby-mode-hook
             (lambda ()
               (require 'rcodetools)
               (require 'auto-complete-ruby)
               (make-local-variable 'ac-omni-completion-sources)
               (setq ac-omni-completion-sources '(("\\.\\=" . (ac-source-rcodetools)))))))
(require 'anything-rcodetools)


;;Rakefile
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))

;; Rinari -- For Ruby on Rails
(add-to-list 'load-path "~/work/rinari")
(require 'rinari)

;haml-mode
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;;sass-mode
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
