;;; -*- lexical-binding: t -*-

(defgroup show-eof-mode nil
  "Minor mode to show EOF marker."
  :group 'emacs)

(defcustom show-eof-mode-marker-string "[EOF]"
  "Marker string to mark EOF."
  :group 'show-eof-mode
  :type 'string)

(defface show-eof-mode-marker-face
  '((t (:inherit font-lock-comment-face)))
  "Face used to fontify `show-eof-mode-marker-string'."
  :group 'show-eof-mode)

(defvar-local show-eof-mode--ov nil)

(define-minor-mode show-eof-mode
  "Minor mode to show EOF marker."
  :init-value nil
  :global nil
  (if show-eof-mode
      (unless show-eof-mode--ov
        (let ((ov (make-overlay (point-max) (point-max) (current-buffer) nil t))
              (str (propertize show-eof-mode-marker-string 'face 'show-eof-mode-marker-face)))
          (put-text-property 0 1 'cursor 1 str)
          (overlay-put ov 'after-string str)
          (setq show-eof-mode--ov ov)))
    (when show-eof-mode--ov
      (delete-overlay show-eof-mode--ov)
      (setq show-eof-mode--ov nil))))

(provide 'show-eof-mode)
