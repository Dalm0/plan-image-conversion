(define (animation blocksworld)

; Defines the Animation profile for BlocksWorld
; See worked example in AP Guide.md for more comments.
; Available at https://bitbucket.org/planning-researchers/classical-domains/src/208a850d2ff2a27068329ad578ad99af9ec7e5c5/classical/?at=master
; 08/10/2018
; Written for Project Planning Visualisation
; By Yi Ding
 
 ; Specifies one object is on top of the other
  (:predicate on
                 :parameters (?x ?y)
                 :effect(
                 (equal (?x x) (?y x))
                 (equal (?x y) (add (?y y) (?y height) 2))
                 )
  )
 

; Specifies an object is on the table
  (:predicate on-table
                 :parameters (?x)
                 :effect(
                 (assign (?x x) (function distributex (objects ?x) (settings (spacebtw 40))))
                 (equal (?x y) 0)
                 )
   )

 ; Specifies an object is being held by the vlaw
  (:predicate holding
 
                 :parameters (?x)
                 :custom claw
                 :effect (
                 (equal (?x x) (claw x))
                 (equal (?x y) (add (claw y) -60))
                 )
 
  )
  ; Visual Object for the Block (default object)
  (:visual block
              :type default
              :properties(
                (prefabImage img-block)
                (showName TRUE)
                (x Null)
                (y Null)
                (color RANDOMCOLOR)
                (width 80)
                (height 80)
              )
  )
 
 ; Custom object representing the claw
  (:visual claw
              :type custom
              :objects claw
              :properties(
                (prefabImage img-claw)
                (showName FALSE)
                (x 300)
                (y 880)
                (color BLACK)
                (width 80)
                (height 40)
                (depth 1)
               )
  )

  ; Custom object representing the board (ie rectangle on which blocks are placed)
  (:visual board
              :type custom
              :objects board
              :properties(
                (prefabImage img-board)
                (showName FALSE)
                (x 0)
                (y 0)
                (color BLACK)
                (width PANEL_SIZE)
                (height 5)
            
              )
  )

  (:image (img-claw iVBORw0KGgoAAAANSUhEUgAAAEoAAABUCAYAAAAlDKGaAAABdklEQVR4Xu3cPU7DQBhF0cnKYGfAzsLO0Efl/IBuEzQox1WKJySOb1yNc1quJHBKK6O1G9TLWuv1cF/Oa63PHe7TblBva633A8x8/gB1KwAqVgEKVBSIM0WBigJxpihQUSDOFAUqCsSZokBFgThTFKgoEGeKAhUF4kxRoKJAnCkKVBSIM0WBigJxpihQUSDOFAUqCsSZokBFgThTFKgoEGeKAhUF4kxRoKJAnCkKVBSIs62LmlO4x5O48X96yGzrU8HXd/EhAv/9j87x6TmiPFiuXwQGSlEhkXtFzZsC88bAs1/z3J5n5vd1D2reFDi+PfCsYBePJFA/ZwAqfkVAgYoCcaYoUFEgzhQFKgrEmaJARYE4UxSoKBBnigIVBeJMUaCiQJwpClQUiDNFgYoCcaYoUFEgzhQFKgrEmaJARYE4UxSoKBBnigIVBeJMUaCiQJwpClQUiDNFgYoCcXZT1PWbC3Mi2Kngq/P3u/2eebzZfzK7KOoLP13HqksMK+sAAAAASUVORK5CYII=)
          (img-block iVBORw0KGgoAAAANSUhEUgAAAZkAAAGZCAIAAADUx9uZAAAFCUlEQVR4nO3UwQmAMAAEwcT+e441aALCOvM/uNeOAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPDV3xmutUz8A5nxfpOvgD4CvaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQVaBhRoGVCgZUCBlgEFWgYUaBlQoGVAgZYBBVoGFGgZUKBlQIGWAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwD/dUl0F4s4N228AAAAASUVORK5CYII=)
          (img-board iVBORw0KGgoAAAANSUhEUgAAA84AAAAFCAIAAAAbsCLlAAAACXBIWXMAAAsTAAALEwEAmpwYAAAF7mlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDAgNzkuMTYwNDUxLCAyMDE3LzA1LzA2LTAxOjA4OjIxICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIiB4bWxuczpwaG90b3Nob3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpBQTA1RUE1QjMzMjA2ODExODIyQUM4NjE0MERCRDI1NiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpFNUU1MTE2OEZBQTExMUUzODBFQ0E4Mjg2RkNEODNGOSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpiOGExMDUyNC00ZWIxLTQ0YTAtYjhkOC00ZDA1ZjZjZTY2N2EiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wOkNyZWF0ZURhdGU9IjIwMTgtMDgtMTJUMTI6MjA6MzMrMTA6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDE4LTA4LTEyVDEyOjIxOjU0KzEwOjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDE4LTA4LTEyVDEyOjIxOjU0KzEwOjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgcGhvdG9zaG9wOkNvbG9yTW9kZT0iMyIgcGhvdG9zaG9wOklDQ1Byb2ZpbGU9InNSR0IgSUVDNjE5NjYtMi4xIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RkI3RjExNzQwNzIwNjgxMTgzRDE5QTYzMUY5NDkyQUEiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QUEwNUVBNUIzMzIwNjgxMTgyMkFDODYxNDBEQkQyNTYiLz4gPHhtcE1NOkhpc3Rvcnk+IDxyZGY6U2VxPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6YjhhMTA1MjQtNGViMS00NGEwLWI4ZDgtNGQwNWY2Y2U2NjdhIiBzdEV2dDp3aGVuPSIyMDE4LTA4LTEyVDEyOjIxOjU0KzEwOjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxOCAoTWFjaW50b3NoKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz59ZURaAAAAPElEQVRoge3WQQ0AIBAEMQ4fvM6/GRRhgg0JaRXMc2qvHgAAwG3zdQAAAPzJagMAQITVBgCACKsNAAARB3NVARwx5z0PAAAAAElFTkSuQmCC)
          )
)
