;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-10-11 20:00:55 Monday by taoshanwen>

;; Setting English Font: this works fine for windows 7
(cond
 ((eq system-type 'darwin)
    (set-frame-font "Yahei Consolas Hybrid-15"))

 ((eq system-type 'windows-nt)
    (set-face-attribute
      'default nil :font "Consolas 11")
    ;; Chinese Font
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
                          charset
                          (font-spec :family "SimSun" :size 16)))))

(provide 'font-settings)
