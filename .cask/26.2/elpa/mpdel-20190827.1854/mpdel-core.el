;;; mpdel-core.el --- Provide code to be reused by mpdel modes  -*- lexical-binding: t; -*-

;; Copyright (C) 2018-2019  Damien Cassou

;; Author: Damien Cassou <damien@cassou.me>
;; Keywords: multimedia
;; Url: https://gitlab.petton.fr/mpdel/mpdel
;; Package-requires: ((emacs "25.1"))
;; Version: 1.0.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This file provides some common ground for all MPDel
;; user-interfaces.

;;; Code:
(require 'libmpdel)
(require 'navigel)


;;; `navigel' general configuration

(cl-defmethod navigel-name (entity &context (navigel-app mpdel))
  (libmpdel-entity-name entity))

(cl-defmethod navigel-children (entity callback &context (navigel-app mpdel))
  (libmpdel-list entity callback))

(cl-defmethod navigel-equal (entity1 entity2 &context (navigel-app mpdel))
  (libmpdel-equal entity1 entity2))

(cl-defmethod navigel-parent (entity &context (navigel-app mpdel))
  (libmpdel-entity-parent entity))


;;; Public functions

(defun mpdel-core-open (entity &optional target)
  "Open a buffer showing ENTITY.
If TARGET is non nil and visible on the buffer, move point to
it."
  (let ((navigel-app 'mpdel))
    (navigel-open entity target)))

(defun mpdel-core-selected-entities ()
  "Return the selected entities in the current buffer.

If any entity is marked, return the list of all marked entities.
If no entity is marked but there is an entity at point, return a
list with this entity.  Otherwise, return nil."
  (navigel-marked-entities t))

(defun mpdel-core-add-to-current-playlist ()
  "Add selected entities to current playlist."
  (interactive)
  (libmpdel-current-playlist-add (mpdel-core-selected-entities)))

(defun mpdel-core-add-to-stored-playlist ()
  "Add selected entities to a stored playlist."
  (interactive)
  (libmpdel-stored-playlist-add (mpdel-core-selected-entities)))

(defun mpdel-core-replace-current-playlist ()
  "Replace current playlist with selected entities."
  (interactive)
  (libmpdel-current-playlist-replace (mpdel-core-selected-entities)))

(defun mpdel-core-replace-stored-playlist ()
  "Replace a stored playlist with selected entities."
  (interactive)
  (libmpdel-stored-playlist-replace (mpdel-core-selected-entities)))

(defun mpdel-core-insert-current-playlist ()
  "Insert selected entities after currently-played song.
Start playing the first.

If no entity is selected, restart playing the current song."
  (interactive)
  (let ((entities (mpdel-core-selected-entities)))
    (if (not entities)
        (libmpdel-playback-seek "0")
      (libmpdel-current-playlist-insert entities))))

(defun mpdel-core-dired ()
  "Open dired on the entity at point."
  (interactive)
  (libmpdel-dired (navigel-entity-at-point)))

;;;###autoload
(defun mpdel-core-open-artists ()
  "Display all artists in the MPD database."
  (interactive)
  (mpdel-core-open 'artists))

;;;###autoload
(defun mpdel-core-search-by-artist (name)
  "Display all songs whose artist's name match NAME.
Interactively, ask for NAME."
  (interactive (list (read-from-minibuffer "Search for artist: ")))
  (mpdel-core-open (libmpdel-search-criteria-create :type "artist" :what name)))

;;;###autoload
(defun mpdel-core-search-by-album (name)
  "Display all songs whose album's name match NAME.
Interactively, ask for NAME."
  (interactive (list (read-from-minibuffer "Search for album: ")))
  (mpdel-core-open (libmpdel-search-criteria-create :type "album" :what name)))

;;;###autoload
(defun mpdel-core-search-by-title (title)
  "Display all songs matching TITLE.
Interactively, ask for TITLE."
  (interactive (list (read-from-minibuffer "Search for title: ")))
  (mpdel-core-open (libmpdel-search-criteria-create :type "title" :what title)))


;;; Mode

(defvar mpdel-core-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "SPC") #'libmpdel-playback-play-pause)
    (define-key map (kbd "M-n") #'libmpdel-playback-next)
    (define-key map (kbd "M-p") #'libmpdel-playback-previous)
    (define-key map (kbd "a") #'mpdel-core-add-to-current-playlist)
    (define-key map (kbd "A") #'mpdel-core-add-to-stored-playlist)
    (define-key map (kbd "r") #'mpdel-core-replace-current-playlist)
    (define-key map (kbd "R") #'mpdel-core-replace-stored-playlist)
    (define-key map (kbd "p") #'mpdel-core-insert-current-playlist)
    (define-key map (kbd "C-x C-j") #'mpdel-core-dired)
    (define-key map (kbd "n") #'mpdel-core-open-artists)
    (define-key map (kbd "s s") #'mpdel-core-search-by-title)
    (define-key map (kbd "s l") #'mpdel-core-search-by-album)
    (define-key map (kbd "s r") #'mpdel-core-search-by-artist)
    (define-key map (kbd "^") #'navigel-open-parent)
    map)
  "Keybindings for all MPDel buffers.")

;; Make it possible to activate `mpdel-core-map' from a keybinding:
(fset 'mpdel-core-map mpdel-core-map)

(provide 'mpdel-core)
;;; mpdel-core.el ends here
