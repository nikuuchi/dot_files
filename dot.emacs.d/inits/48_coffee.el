(require 'coffee-mode)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))


;; Configure tabs for Coffescript.
(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook  '(lambda() (coffee-custom)))

;;coffee-compile-buffer
(define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)

;;Compile-on-save
;;Hitting the key sequence C-c C-o C-s turns on (toggles) the compile-on-save minor mode in coffee-mode. To enable it by default:
(add-hook 'coffee-mode-hook '(lambda () (coffee-cos-mode t)))

