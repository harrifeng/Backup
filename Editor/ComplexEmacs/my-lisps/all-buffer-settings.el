;; -*- Emacs-Lisp -*-
(define-key global-map (kbd "C-x M-n") 'next-buffer)
(define-key global-map (kbd "C-x M-p") 'previous-buffer)

;; 按下C-x M-k立即关闭掉当前的buffer
(global-set-key (kbd "C-x M-k") 'kill-this-buffer)

;; ibuffer
(if is-before-emacs-21 (require 'ibuffer-for-21))
(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'all-buffer-settings)
