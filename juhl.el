;; determine OS environment
(defconst macosxp (eq system-type 'darwin) "is Mac OS X ?")
(defconst win32p (eq system-type 'windows-nt) "is Windows ?")
(defconst unixp (eq system-type (or 'gnu/linux 'berkeley-unix)) "is FreeBSD ?")

;; stop creating those backup~ files
(setq make-backup-files nil)
;;(setq backup-directory-alist '(("."
;;. "/home/mesmento/.emacs.d/backup-files")))

;; YES ==> Y , NO ==> N
(fset 'yes-or-no-p 'y-or-n-p)

;; stop creating those #auto-save# files
(setq auto-save-default nil)

;; cursor type
(setq-default cursor-type 'bar)

;; language environment
(setq current-language-environment "UTF-8")

;; user information
(setq user-full-name "Ju-hyung Lee"
      user-mail-address "jufoot@gmail.com"
      message-from-style 'parens)

;; syntax highlight
(global-font-lock-mode t)

;; highlight for TODO, BUG, ..
(font-lock-add-keywords 'c++-mode
                        '(("\\<\\(FIXME\\):" 1 c-nonbreakable-space-face prepend)
                          ("\\<\\(TODO\\):" 1 c-nonbreakable-space-face prepend)
                          ("\\<\\(BUG\\):" 1 c-nonbreakable-space-face prepend)
                          ("\\<\\(NOTE\\):" 1 c-nonbreakable-space-face prepend)))

;; color theme
(require 'color-theme)
;;(color-theme-initialize)
;;(setq color-theme-is-global t)
(defun color-theme-juhl ()
  "Customized color theme by Ju-hyung Lee"
  (interactive)
  (color-theme-install
   '(color-theme-juhl
     ((foreground-color . "black")
      (background-color . "white")
      (background-mode . dark)
      (cursor-color . "#FF2277"))
     (default ((t (nil))))
     (region ((t (:background "#004080" :foreground "#FFFFFF"))))
     (highlight ((t (:background "#FFDFFF"))))
     (isearch ((t (:background "#333300" :foreground "#FF3300"))))
     (font-lock-type-face ((t (:foreground "#64208B"))))
     (font-lock-constant-face ((t (:foreground "#337780"))))
     (font-lock-builtin-face ((t (:foreground "#7F7700"))))
     (font-lock-keyword-face ((t (:foreground "#B000B0"))))
     (font-lock-comment-face ((t (:foreground "#007000"))))
     (font-lock-delimeter-face ((t (:foreground "#007000"))))
     (font-lock-preprocessor-face ((t (:foreground "#723920"))))
     (font-lock-string-face ((t (:foreground "#C00000"))))
     (font-lock-function-name-face ((t (:foreground "000000"))))
     (font-lock-variable-name-face ((t (:foreground "000000"))))
     (font-lock-doc-face ((t (:foreground "#458B74"))))
     (font-lock-doc-string-face ((t (:foreground "#EE3300" :background "#323200"))))
     (font-lock-reference-face ((t (:foreground "#FFFF00"))))
     (font-lock-warning-face ((t (:bold t :foreground "Red" :weight bold))))
     (show-paren-match-face ((t (:background "#FFDFFF" :foreground "blue" :weight bold))))
     (show-paren-mismatch-face ((t (:bold t :background "#FFDFFF" :foreground "red"))))
     (speedbar-directory-face ((t (:foreground "#FFFF44"))))
     (speedbar-file-face ((t (:foreground "#DDEEFF"))))
     (speedbar-highlight-face ((t (:foreground "cyan" :background "#101C33" :underline t))))
     (speedbar-selected-face ((t (:foreground "white" :background "#003A72"))))
     (speedbar-separator-face ((t (:background "blue" :foreground "white" :overline "gray"))))
     (speedbar-tag-face ((t (:foreground "antique white" :weight bold))))
     (underline ((t (:foreground "yellow" :underline t))))
     (modeline ((t (:foreground "black" :background "wheat"))))
     (modeline-mousable ((t (:foreground "dark cyan" :background "wheat"))))
     (modeline-mousable-minor-mode ((t (:foreground "dark cyan" :background "wheat"))))
     (minibuffer-prompt ((t (:foreground "#FFFFFF" :background "#000000"))))
     (eshell-prompt-face ((t (:foreground "#88FFCC"))))
     (italic ((t (:foreground "dark red" :italic t))))
     (bold-italic ((t (:foreground "dark red" :bold t :italic t))))
     (bold ((t (:bold)))))))

(eval-after-load "color-theme" '(color-theme-juhl))

;; license auto-insert
;;(load-library "~/.emacs.d/xlicense.el")

;; prevent new frame popup
(setq ns-pop-up-frames 'nil)

;; show mark region highlight
(transient-mark-mode t)

;; highlight current line
(global-hl-line-mode t)

;; highlight paren pair
(show-paren-mode t)

;; set default tab width
(setq default-tab-width 4)

;; blink cursor
(blink-cursor-mode t)
(setq blink-cursor-interval 0.2)
(setq blink-cursor-delay 0)

;; mouse wheel speed
(setq mouse-wheel-progressive-speed t)
(setq mouse-wheel-scroll-amount (quote (1 ((shift) . 3) ((control)))))

;; speedbar
(setq speedbar-track-mouse-flag t)
(setq sr-speedbar-mode-hook '(lambda () (interactive) (other-frame 0)))

;; eshell
(setq eshell-ls-initial-args '("-h"))

;; desktop save mode
(desktop-save-mode t)

;; auto-complete-mode
;; http://www.emacswiki.org/emacs/AutoComplete
;; http://www.emacswiki.org/emacs/AutoCompleteSources
;; http://www.emacswiki.org/emacs/init-auto-complete.el
;;(require 'auto-complete)
;;(require 'auto-complete-extension)
;;(require 'ac-dabbrev)
;;(global-auto-complete-mode t)
;; (custom-set-variables
;;  '(ac-sources
;;    '(ac-source-words-in-buffer
;;      ac-source-dabbrev)))

;; font
(defun my-set-font (name size)
  (interactive
   (list (completing-read "font-name: "
                          (mapcar (lambda (p) (list (car p) (car p)))
                                  (x-font-family-list)) nil t)
         (read-number "size: " 12)))
  (set-face-attribute 'default nil
                      :family name
                      :slant  'normal
                      :weight 'normal
                      :width  'normal
                      :height (* 10 size))
  (frame-parameter nil 'font))

;; set frame position & size
(set-frame-position (selected-frame) 300 99)
(set-frame-size (selected-frame) 225 68)

;;(split-window-horizontally)

;; sr-speedbar
;;(require 'sr-speedbar)
;;(setq sr-speedbar-right-side nil)
;;(setq sr-speedbar-width 36)
;;(setq sr-speedbar-auto-refresh t)
;;(setq sr-speedbar-skip-other-window-p t)
;;(sr-speedbar-open)

;;(other-window 1)
;;(view-echo-area-messages)
;;(split-window-vertically -32)

;;(other-window 1)
;;(eshell)
;;(other-window 1)

;; speedbar
;; (speedbar t)

;;(speedbar-add-supported-extension ".m")
;;(speedbar-add-supported-extension ".mm")
;;(speedbar-add-supported-extension ".rb")

;;(window-configuration-to-register '1)

;; smart tab
;;(add-to-list 'load-path "~/.emacs.d/smart-tab")
;;(require 'smart-tab)
;;(global-smart-tab-mode 1)

(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line "
  (interactive "P")
  (let ((beg (line-beginning-position))
        (end (line-end-position)))
    (copy-region-as-kill beg end))
  )
(global-set-key (kbd "C-c l") (quote copy-line))

;; global key bindings
;;(global-set-key "C-Z" nil)
(global-set-key (kbd "<escape>") 'keyboard-quit)
(global-set-key "\C-l" 'goto-line)
(global-set-key '[f1] nil)
(global-set-key '[f2] nil)
(global-set-key '[f3] nil)
(global-set-key '[f4] nil)
(global-set-key '[f5] nil)
;;(global-set-key [tab] 'hippie-expand)
;;(global-set-key [C-tab] 'yas/expand)
(define-key global-map [f8] 'xcode-build)

;; show line numbers in ruby-mode
(add-hook 'ruby-mode-hook 'linum-mode t)

;; set hosw-paren-style
(setq show-paren-style 'parenthesis) ; highlight just parens
                                        ;(setq show-paren-style 'expression) ; highlight entire expression

;; toolbar off
(setq tool-bar-mode nil)

(setq font-lock-maximum-decoration t)

;; visible BELL
(setq visible-bell nil)

;; GLSL mode
(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.rprog\\'" . glsl-mode))

;; which funciton mode
(which-function-mode)

;; C++ and C mode...
(defun my-c++-mode-hook ()
  ;; custom tab style  
  (setq tab-width 4)
  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq indent-tabs-mode t)
  (setq indent-line-function 'insert-tab)
  ;;(setq c-default-style "k&r")  
  (c-set-offset 'substatement-open 0)
  ;;(setq c-basic-offset 4)
  (setq c-indent-level 4)
  (setq c-argdecl-indent 0)
  (setq c-continued-statement-offset 4)
                                        ;(setq c++-tab-always-indent t)
  ;;(setq c++-auto-hungry-initial-state 'none)
  ;;(setq c++-delete-function 'forward-delete-char)
  ;;(setq c++-empty-arglist-indent 4)
  (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c++-mode-map "\C-ce" 'c-comment-edit))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(defun my-c-mode-hook ()
  (setq tab-width 4)
  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (define-key c-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c-mode-map "\C-ce" 'c-comment-edit)
  (setq c-auto-hungry-initial-state 'none)
  (setq c-tab-always-indent t)
  ;; BSD-ish indentation style
  (setq c-indent-level 4)
  (setq c-continued-statement-offset 4)
  (setq c-brace-offset -4)
  (setq c-argdecl-indent 0)
  (setq c-label-offset -4))

(add-hook 'c-mode-hook 'my-c-mode-hook)

;; SLIME
;;(setq inferior-lisp-program "/usr/local/bin/sbcl")
;;(add-to-list 'load-path "/Users/juhl/.emacs.d/slime")
;;(require 'slime)
;;(slime-setup)

;; smart tab
;;(require 'smarttab)
;;(global-smart-tab-mode t)

;; header file auto file-mode
(defun my-choose-header-mode ()
  (interactive)
  (if (string-equal (substring (buffer-file-name) -2) ".h")
      (progn
        (let ((dot-m-file (concat (substring (buffer-file-name) 0 -1) "m"))
              (dot-c-file (concat (substring (buffer-file-name) 0 -1) "c")))
          (if (file-exists-p dot-m-file)
              (objc-mode)
            (if (file-exists-p dot-c-file)
                (c-mode)
              (c++-mode))))
        )
    ))
(add-hook 'find-file-hook 'my-choose-header-mode t)

;; mac specific settings
(when macosxp
  (setq mac-option-key-is-meta nil)
  (setq mac-command-key-is-meta t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil)
  (my-set-font "Menlo" 12)

  ;; xcode build
  (defvar xcode-build-sdks nil)
  (defvar xcode-build-sdk-history nil)

  (dolist (line
           (split-string
            (with-temp-buffer
              (call-process "xcodebuild" nil t nil "-showsdks")
              (buffer-string))
            "\n" t))
    (let ((comps (split-string line "-sdk " t)))
      (if (> (length comps) 1)
          (add-to-list 'xcode-build-sdks (car (last comps)))
        )))

  (defun xcode-build ()
    (interactive)
    (let ((command "xcodebuild -activeconfiguration -activetarget"))
      (setq command
            (concat
             command
             (if xcode-build-sdks
                 (let ((default-sdk (or (car xcode-build-sdk-history) (car xcode-build-sdks))))
                   (concat
                    " -sdk "

                    (completing-read
                     (format "Compile with sdk (default %s): " default-sdk)
                     xcode-build-sdks
                     nil
                     t
                     nil
                     'xcode-build-sdk-history
                     default-sdk
                     ))))
             (let ((dir ".") (files nil))
               (while
                   (progn
                     (setq files (directory-files dir nil "\\.xcodeproj\\'"))
                     (and (not (string-equal "/" (expand-file-name dir))) (null files)))
                 (setq dir (concat (file-name-as-directory dir) "..")))
               (unless (null files) (concat " -project " (file-name-as-directory dir) (car files))))
             ))
      (compile (read-string "Compile command: " (concat command " "))))))

;; windows specific settings
(when win32p
  (setq w32-pass-lwindow-to-system nil)
  (setq w32-pass-rwindow-to-system nil)
  (setq w32-pass-apps-to-system nil)
  (setq w32-lwindow-modifier 'super)
  (setq w32-rwindow-modifier 'super)
  (setq w32-apps-modifier 'hyper)
  (setq w32shell-cygwin-bin "C:\\cygwin\\bin")
  (my-set-mac-font "Meslo LG S" 9))

;; start server
(server-start)