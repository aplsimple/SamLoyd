#! /usr/bin/env tclsh
###########################################################
# Name:    gluedcycles.tcl
# Author:  Alex Plotnikov  (aplsimple@gmail.com)
# Date:    Dec 19, 2024
# Brief:   Handles puzzle "Glued cycles".
# License: MIT.
###########################################################

package require Tk

namespace eval gluedcycles {

  variable defaultPieceNumber 12

  proc run {{w .} {cnum ""} {onepend 1} {solo no}} {
    # Runs the puzzle.
    #   w - parent window
    #   cnum - number of pieces
    #   onepend - only 1 pending piece allowed
    #   solo - true, if runs as stand-alone app

    variable defaultPieceNumber
    if {$cnum eq {}} {set cnum $defaultPieceNumber}
    [Puzzle new $w $cnum $onepend $solo] destroy
    if {$solo} exit
  }

  image create photo gluedcycles::runImage -data {iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAC+lBMVEUAAACBAABsAABiAwNkAAB/
AACRAwNxDA2HBwdrBweRBgZxAACRAABkAABnAACJAABuAAB+AACOAABgAABfAAB+AACXXmO7YGC6
amu7ZWWyUVGlRUWkPDx+NzmMDAx0MDOsFxeMJiaFAgKkS0ugDw+QBwd7Ky5+NzqiMDCVCAihJSV7
ISOOBARmEhObHR53BQWEGRmkKSmJFhaZDAyVBgZ6AQGPAwNmCgplAQGQAwOIAAB8AACLAABlAQF9
AABtAwODAABdAAB1AACJAACYAQFpAACPAACLAACLAABbAABiAABcAAByAACMAACPAABgAABfAACP
AADz8/bx8fXZ2eT////19fjd3OXlLCzmMDDX1uLqNzfoNDTZ2OLwRkbsPDziJCT5/P76+vvu7vPb
4u3d3ufb2+X7VFT1Tk7ySUnzRETwQkLuPj7jKCjgIiLfHh7w+Pzr9fv29vnj7/jg6/Ph6PHh4Ojf
3+jV1eDrOTntNzfqNTXnMjLoLCzgJiXlIyPlHR3cGBjYDAz5///v+v74+Pru9Pnu8fbe7PXh5e3d
4Ont4+jCydTgv8bGucKlnqfVoqLxoaL+oaHkkZX9jIzvfH75cXLuV1iHUFX5UVHoTU7dQUPuQUHz
QEDuOzvaOjvpLi7rKCjiJibGJia2IyPVIiKnHBzcGxvgFxesFRXaFBS+EhLTERHbDw+cDg7p/P/1
9/zk9Pz18fLs6/De5O/Z3Ofy4ub/4+Xs4OHO0dzr2drJzti8ztjxztK7xtLhytHoyc7bxc3uxsnl
xcW1usThw8PlwMDsu7/mub/WtLauqrPqparxp6nfo6iwlJ3ymJjbkZfRlJWvjZTqi47Ki4ydhozD
gYbchYXehIT0g4T/g4PZgoKTdn3ddXmaaW/5bW2/bW38a2vkZ2rEaGjcZWjAZWWNXmPDXl/jW134
XFv3V1foVlfxT0+pPkHxPT3ROTnlODjgLi/WLi6TLC2+Hh66Hh7JGRnWFBWlEBDbDg2uDAzZAQGe
AQHIAACsSdcRAAAAUnRSTlMADgKQNCP6xbm2paF8b2ZbVk08KBsT/f37+ff19PPw6+vn5OPj4+Df
3dLQ0M/OzMvKx8bCu7Gtq56Yk4+LiIeFgoB5dXNybW1TUk9HPTQsIAsGPp35NQAAAi9JREFUOMti
GBjAyOLKac+ES1aYj9tA+vENRRFskqwC1kYyT6+fnzLt1TIvDHMFHTiUH9yeOGnK/TfRtQu/2KJI
+rpzaUhM2JW0/dbDjKx5VdWRtUvZkeRdDMUvHk4KDU3csO1lRmZcTmVNxKJ6OWGEAuNjoUDZorCg
oIKbWZnZ8dWRuXkNP/gQCngmhCa1FoWFBQe3nJkblxNdE1GXv2K1BUKBkCRQQVhYUHBwwaGsnPgY
oAHLV63RZ0S4UWsTyAKggrbu6VXRkREJ+Y1Nv9lYEEZwHQ0FygcFJycXTl0QE5Gw4mfT99lveREK
3K6EhoHlNxeeXljfUDf7yYWDxX3mCAV+Us0gF7S3F64/MOvR5N6yko6Urli1AIQKwPR2JAYVtLR1
H7/8+sTG4pLO8vCQ2FIxb4QCy5PNwXsnTp1eVdswubisrDwcqGDLJUeEAv7nk6bNzHo3rzKm/kVp
Z3lqeFpI1NY+TiZENCqkp2cAwzA6MuHj/lKQfEhUVIg6IsoDTWalZ8TNqQR6sfFsSWp4SEhsVEXK
PU+EHTbv0zPngMNw7d2O8DSQgqiUc8wIBR5LZoIjYVH+2vldICsqdvbs69dFKBBVicuOj4kARUJT
b0rF7p4j/XdmyCOZwGA2PxsSCWv+Xttz6uozWXZmAX/khOu8eG71grql31b/+vN5hjY3Lwt6khRa
+eHT4q8r17EpmTr5iGLLC5pLlq1T5bATZMSVH3h0rPhZmRgGAgAA43LedPuyX/QAAAAASUVORK5C
YII=}
  image create photo gluedcycles::helpImage -data {iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAB8lBMVEUAAABngsVAOYZIV5hJUpVK
TZJqhcZHXJtLSZFCO4gyLoBhfsRaeMFXVbRPcsVNSZE4UpMsKHsKOacBIWwCAnsAACQAAACaz/+D
t//A4v8shP+p1v/I5f9fn/+74P9mpv99uP9xr/+23f8GCQyq2P+Xzf+OyP9prf91dsC75v+w3P+b
zv+Tyv+Nxf+Iwf9ztf8uhv/H7P/C6f/M6P+t3v+i0v+Xzv+Wy/+LxP+Lw/+Gw/+CwP9/vv9lqf9p
qP9hof+KvO6HrM9ygMVze8N2mLcVGh3Q7v/E4/+t4f+63v+03v+03P+s2v+k2f+u2P+i1/+m1f+a
0/+cz/+vzv+Rzf+Fvf+Buv9/uP93uP99tv9usf9dpf9Snf9Jlv9fn/uXyPSOw/NWkeeVvN9xicmG
qchxhMdVaXkyUHlAUF8zQU0uPUwpOkwrNT4bJjIVHioPFBkMERXF5P/A5P+44/+14f+c1f+e0P+e
z/+Rxv94u/97uv92sf91sf9zsP9bo/9BkP8de/8Wd//M6v7D4Pqp0PSx1vOfzfFjofGs0Oxrpeuu
z+mcweKItNiDrteeus9xhch/pMdqlsWHobhahLZ2lLB3kKdui6c+Zp5Zep1vhpxqgJVUdJVabX1E
XHQ8SlgrP1cxQ1UnN0gwPEcmLzYhLDYOGCWopqx7AAAAFnRSTlMA8czV1dXz1tXOyffz8vHWy8eL
YF9SueqgGAAAAZVJREFUOMut0kVTw1AUhmGsuMuB4JAmhQqFukIVd3fXOu7u7u72P0nZheay6rt+
5s65M5+Pt4oNGxg4HRoyGAxGozHHXUQ8DYRjJJ8UKFRqzUKrsL2do11pCKWBQIKoYNdKeXJSpRFy
Ojq71tpCaMA3kS0uwcoquJU1MmXLcmFRfpLfH5CSik2Iqvv1xzpSnZWRlswACg6e7C4zjlsvWwuZ
QPGJGXD9zpEFYITDANgbNgDQS6p6nQC3Wk9QuWmmwI2EV2cFcHQzvFA8DODsZ/Pq3gHwPoZfiLGL
60OutEbnQoBUTCQq55b2vAHAd3cyE0jPLh8cdgDViBYBcl/AnX23CAVGgep1n5OGBLjt+VwtzECC
j7HSaTIzCwkmr0xV/Dw0SN8ymXpkaIDtfQJ86RRIUPAAVI+NaHDvBndogG2PAVh6lf8cyR08qycQ
R1aLx7Gy7CmJVK5oXvIcbaBMUDtL8AUqzfzv6lfXW+izjyypn+ERcv6cQJnX1NSc2bbYEEMDcdFB
Qf5UAVQsFis4OCo0wcdL/QAftmvBghRUFAAAAABJRU5ErkJggg==}
  image create photo gluedcycles::exitImage -data {iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAC7lBMVEUAAACCAABpAACbAAChAABt
AAB0AAB8AwNkAQFmAQCLAQB2AQGRAACjAABpAACXAABYAACdAABaAABfAAByAABqAAB8AACBAACM
AACUAACmAAB7AABeAACIAABtAACUAACoAACjAABeAAB0AACPAACWAACpAACnAACtDQqlAAClAABk
AABkAABaAABaAABgAAD////7///08fL5///WIR3FBQPr///v//7//f3/+vqqHxvFHhjLGhW/FAK9
AgD17u7/7+3uhIW7cHDDaGj4eF7nVki9JSDNIh+9FRGWDwzRBgGxBgGnBgGsAwC1AgD2///y///r
/f396enz6Ojz4eH93932zc3rzMz8xMThsrT1np7TgYHqfX7hgn3ye3ytbGzSY2HHYGDuU1PTV1HT
PzveMzDNKSLMIRiyDg3JFgLOEALUBQHEFQDBAQDOAAD9///u+vr5+fn59fX/9fTw5eXjwsPmvLzo
t7j3t7f4srL9qqnvp6j2qKftrKbXoqLjn6D0mJnflpfYlZb0k5PmmZLJkJDhjo/yjY77i4vliYj1
hH3Le33bfXqyc3PddHHGcXH7iG+5Z2ftZWXbZF/MX1/daV7pYF3YXlbLVlboWFXiSUnLR0C+QEDD
RD7pQDzCNzG7MDHYOS60LyrjKCjUKia4JyO0HRuzGRXIHxOkFROXFBKRFBKODgyICwmuCwZ2BATA
CwPLGgHtIADoIAC7EgCgAAD/8PH21dXlxsbwwsPxv8Dvra7Jra3trKzcqKjvoKL2n6HAnZ38qZjM
l5f/mZXNjY3mior/ln7De3v+dHTsc3PncHH1f3DidXDJamrWb2mzaGjpZGD/YF+4X1+tXFzvalng
YlihWFjfVVXfWlGqTk6+TU3tTE26TEztYUr/S0nJTUflRkbjU0LQQ0HjQEHgRj35OzzMOzrYOjnP
Nja6NjbpMTG6KirTNijkPiGlIh7cNRrDFhLOERDHDg7jKgnPHQagAwHVEgC4DQDIBwDTKbTyAAAA
MHRSTlMABNnPkjoO+/338/Hl3sq+vrm3r6yqqKWglo2BgXl5ZWRdSDAvIyIc/unozcyWlR3Wp9tz
AAACfElEQVQ4y2KgL1BXZBFkZuaXlFfFKq3Gwrv8wfmevoS5VjwSKpjyClrzW0KLLS0dQiOqzi7i
kmVElWaUWhfrYGBgWdobXxdRWXVkuqc4G4oCqYxaAwOLbUHxB/dcr66Jau64uEqMEdl8gDRA8sVB
23uLDOLbopod407OXCON5D7NWKC8ZUhomJO9wYXOhpi4U5MupbCzwhWwzHcwsLBovdIdAVQw0XHG
rTmTpiXdtxKBWaLO22JgaXDUqeREdL9RvnPyRPvWN0kPn6VyK0MVKC4/5GBQfrnIoO52v72h84LD
BvlO7vNez1stB7Nh9nGXIOcdhuF3j50zMnS+8arUsGTBYpuFVqJQBYLTJ2x61F1YmBgblWhknDhz
1hwjw2g777SlfFAFzFNdNnk1GZbNqHGcYmQ8ZVaS+z7DSF/vdDcmmAKAJrtszoo0bpp8wDHB3zDh
yR2TaOPwDN8VcAX8yWAFjemu0x63NT5PXbKhB6jAJ32ZNlSB5NwJX7zq/ctMszZm2tltsP3hV+9f
7u3jvlIYqkDequtddl+AUcrPjZk5ObZb/NKCAzp915mslYEqUOWZeu+7SYj5zk+mObZAedO95kYv
t3pYc8LDWmLRmQ95pwMKdr0wzbXLXbK7wLzd28fEUwgenypcyVe/ejWYBwZXx8TsDwk0rzT9ZuPB
oYSITlnPa66ZXnHBgWYgYNT+eetHm/W6yAkKMPFVN11XmC7uqggLq+hI9fOxsWEXQElSbGJrZru+
tc3Ny87Os/P1MPFYL6CPliil2d+nPF2YZm1t7W5i7cmhB9OPAKwi3Kutlrq5LVu5llNICWvOUJYT
5WNi0hGWYWVkoCcAAOTi2xaCYJqcAAAAAElFTkSuQmCC}

  ## ________________________ EONS _________________________ ##

}

# ________________________ Class gluedcycles::Puzzle _________________________ #

oo::class create gluedcycles::Puzzle {

  variable TITLE SRCNUMBER TRGNUMBER PCERADIUS PI FONTLARGE FONTSMALL
  variable TTLHEIGHT TOOLHEIGHT MSGHEIGHT MARGIN HEIGHT WIDTH WIDTH1 WIDTH2
  variable BGSUCCESS BGPENDING BGPENDING1 BGBAD BGCANVAS BGWAIT BGMSG
  variable BGSUCCESS2 BGPENDING2 BGBAD2 BGWAIT2 FGCIRCLE1 FGCIRCLE2 FGCIRCLE3
  variable Win Solo Level OldLevel Wcan1 Wcan2 Wcan3 Wcan4 D Targets Circles Pieces Eps1

constructor {wpar cnum onepend solo} {
  # Constructs and runs the puzzle.
  #   wpar - path to parent window
  #   cnum - number of pieces
  #   onepend - only 1 pending piece allowed
  #   solo - true, if runs as stand-alone app

  my variable WIDTH    ;# width of puzzle
  my variable HEIGHT   ;# height of puzzle (without accessories)
  my variable WIDTH1   ;# width of source
  my variable WIDTH2   ;# width/height of target
  my variable Win      ;# puzzle window
  my variable Solo     ;# if run stand-alone
  my variable Level    ;# level current
  my variable OldLevel ;# level previous
  my variable D        ;# data of pieces

  my variable Circles  ;# data of circle pairs

  my variable Targets  ;# compositions for two cycles of targets
  my variable Eps1     ;# epsilon for circles
  my variable FGCIRCLE1  ;# color of 1st circle
  my variable FGCIRCLE2  ;# color of 2nd circle
  my variable FGCIRCLE3  ;# color of puzzle outline

  set Level [set OldLevel 1]
  set Eps1 8
  array set D [list]
  set D(puzzle) P1

  # Settings of Circles: Radius1,X1,Y1, Radius2,X2,Y2, Coordinates of pieces
  array set Circles {
    P1 {
      2.5  2.5  2.6
      4.9  2.5  1.8
      {1.6,1.6  3.6,1.6  5.4,2.6,=  1.6,3.6  3.6,3.6}
    }
    P2 {
      2.5  2.5  2.7
      4.4  2.5  2.7
      {1.6,1.6  3.6,1.6  5.6,1.6,=  1.6,3.6  3.6,3.6  5.6,3.6,=}
    }
    P3 {
      2.8  2.5  2.7
      5.7  2.5  2.4
      {1.7,2.6  3.1,1.1  4.5,2.6  6.3,1.6,=  3.1,4.1  6.3,3.6,=}
    }
    P4 {
      2.8  3.0  3.0
      5.7  3.0  2.1
      {1.2,3.1  2.5,1.5  4.5,2.0  6.3,3.1,=  2.5,4.7  4.5,4.1}
    }
    P5 {
      2.8  2.5  2.8
      5.3  2.5  2.8
      {1.4,2.6  2.8,1.1  4.2,2.6  5.6,1.1,=  7.0,2.6,=  2.8,4.1  5.6,4.1,=}
    }
    P6 {
      2.8  3.0  3.0
      5.7  3.0  2.4
      {1.5,2.0  3.4,1.5  4.6,3.1  6.35,2.05,=  1.5,4.1  3.4,4.7  6.4,4.1,=}
    }
    P7 {
      2.8 3.0 3.0
      5.2 3.0 2.9
      {1.2,3.1  2.5,1.5  4.5,2.0  6.6,2.0,=  2.5,4.7  4.5,4.1  6.6,4.1,=}
    }
    P8 {
      2.8 2.8 3.1
      5.1 2.8 3.1
      {1.0,2.9  2.2,1.2  4.1,2.0  6.0,1.2,=  7.1,2.9,=  2.2,4.6  4.1,4.0  6.0,4.6,=}
    }
  }

  # methods available only during the puzzle
  oo::objdefine [self] {
    export Message ShowHelp CheckMessage Start CheckLevel \
      OnButtonPress OnButtonMotion OnButtonRelease OnPressTarget
  }
  # common data
  set Solo $solo
  set Level $onepend
  set TITLE {Glued Cycles}
  set FONTLARGE {Helvetica 26 bold}    ;# title font
  set FONTSMALL {Helvetica 14 bold}    ;# message font
  set SRCNUMBER $cnum                  ;# number of source pieces
  set TRGNUMBER [expr {$SRCNUMBER+1}]  ;# number of targets
  set PI 3.1415926536
  # sizes
  set PCERADIUS 50   ;# radius of piece
  set TTLHEIGHT 60   ;# height of title
  set TOOLHEIGHT 60  ;# height of tool bar
  set MSGHEIGHT 30   ;# height of message bar
  set MARGIN 40      ;# margin of source/target
  set HEIGHT [expr {$PCERADIUS*7.3}]
  set WIDTH2 [expr {$HEIGHT - $MARGIN*2}]
  set WIDTH1 [expr {$HEIGHT + $PCERADIUS*10 - $WIDTH2}]
  set WIDTH [expr {$PCERADIUS*18 + $MARGIN*2}]
  #colors
  set BGCANVAS black      ;# canvas background
  set BGSUCCESS  #379737  ;# successful piece
  set BGSUCCESS2 #155515  ;# border of successful piece
  set BGBAD      #ff4243  ;# bad piece
  set BGBAD2     #400000  ;# border of bad piece
  set BGPENDING  #caca00  ;# pending piece
  set BGPENDING1 #e48200  ;# border of moved piece
  set BGPENDING2 #4e4e0e  ;# border of pending piece
  set BGWAIT     #888888  ;# piece waiting
  set BGWAIT2    #464646  ;# border of pieces waiting
  set BGMSG      #ff6bff  ;# message
  set FGCIRCLE1  #804000;#d252d2
  set FGCIRCLE2  #b07030;#ff8aff
  set FGCIRCLE3  #66a6e6;#d252d2
  # build & run the puzzle
  set wpar [string trimright [winfo toplevel $wpar] .]
  set Win $wpar.gluedcycles
  toplevel $Win
  wm withdraw $Win
  my BuildMain
  my BuildPuzzle
  my BuildAccessories
  my Start
  my Message {Rotating two circles in "Puzzle", compose "Wanted" pattern}
  bind $Win <Escape> "destroy $Win"
  bind $Win <F1> "[self] ShowHelp"
  update
  wm resizable $Win 0 0
  ::tk::PlaceWindow $Win widget $wpar
  wm deiconify $Win
  tkwait visibility $Win
  tkwait window $Win
}

## ________________________ Build GUI _________________________ ##

method BuildMain {} {
  # Builds main frames of the puzzle.

  set Wcan  $Win.can
  set Wcan1 ${Wcan}1  ;# title
  set Wcan2 ${Wcan}2  ;# tools
  set Wcan3 ${Wcan}3  ;# source
  set Wcan4 ${Wcan}4  ;# target
  $Win configure -background $BGCANVAS ;# to avoid shimmering white-black
  wm title $Win $TITLE
  pack [canvas $Wcan1 -width $WIDTH -height $TTLHEIGHT -bg $BGCANVAS \
    -highlightthickness 1 -highlightbackground $BGCANVAS]
  pack [frame $Wcan2 -width $WIDTH -height $TOOLHEIGHT -bg $BGCANVAS \
    -highlightthickness 1 -highlightbackground $BGCANVAS] -expand 1 -fill x
  pack [canvas $Wcan3 -width $WIDTH -height $HEIGHT -bg $BGCANVAS \
    -highlightthickness 1 -highlightbackground $BGCANVAS]
  pack [frame $Win.separ -width $WIDTH -height $TOOLHEIGHT -bg $BGCANVAS \
    -highlightthickness 1 -highlightbackground $BGCANVAS] -expand 1 -fill x
  pack [ttk::separator $Win.separ.s -orient horizontal] \
    -expand 1 -fill x -padx $MARGIN
  pack [canvas $Wcan4 -width $WIDTH -height $MSGHEIGHT -bg $BGCANVAS \
    -highlightthickness 1 -highlightbackground $BGCANVAS]
}
#_______________________

method BuildPuzzle {} {
  # Builds the puzzle.

  foreach k [array names D -glob ID,*] {
    $Wcan3 delete $D($k)
  }
  array unset D *
  set D(puzzle) P1
  set zoom 0.2
  set margin [expr {$MARGIN/$zoom}]
  my BuildPuzzleBox P1 menu $BGPENDING $BGPENDING "$margin $MARGIN" $zoom
  my BuildPuzzleBox P2 menu $BGPENDING $BGPENDING "700 $MARGIN" $zoom
  my BuildPuzzleBox P3 menu $BGPENDING $BGPENDING "$margin 380" $zoom
  my BuildPuzzleBox P4 menu $BGPENDING $BGPENDING "700 350" $zoom
  my BuildPuzzleBox P5 menu $BGPENDING $BGPENDING "$margin 750" $zoom
  my BuildPuzzleBox P6 menu $BGPENDING $BGPENDING "700 730" $zoom
  my BuildPuzzleBox P7 menu $BGPENDING $BGPENDING "$margin 1100" $zoom
  my BuildPuzzleBox P8 menu $BGPENDING $BGPENDING "700 1130" $zoom
  $Wcan3 create text 130 350 -text "Selected" -fill $BGPENDING -font $FONTSMALL
  $Wcan3 create text 370 350 -text "Wanted" -fill $BGSUCCESS -font $FONTSMALL
  $Wcan3 create text 720 350 -text "Puzzle" -fill $FGCIRCLE2 -font $FONTSMALL
  foreach idk [array names D -glob *menu*] {
    $Wcan3 bind $D($idk) <ButtonPress> "[self] Start $idk"
  }
  my SelectPuzzle $D(puzzle)
}
#_______________________

method BuildPuzzleBox {NP type bg1 bg2 shift zoom args} {
  # Builds a puzzle box.
  #   NP - name of puzzle
  #   type - box type
  #   bg1 - outline color of 1st circle
  #   bg2 - outline color of 2nd circle
  #   shift - pair of X, Y coordinates to shift the puzzle box
  #   zoom - zoom factor (0.1, 0.5, 1.0) for the puzzle

  lassign $shift X Y
  lassign $Circles($NP) X1 Y1 R1 X2 Y2 R2 pieces
  foreach crc {1 2} {
    set x [expr $X+[set X$crc]*$PCERADIUS+$Eps1]
    set y [expr $Y+[set Y$crc]*$PCERADIUS+$Eps1/2]
    set r [expr [set R$crc]*$PCERADIUS+4]
    foreach v {x y r} {set $v [expr [set $v]*$zoom]}
    set xy2 [my CircleCoords $x $y $r]
    set D(ID,$NP$type,crc$crc) [$Wcan3 create oval $xy2 \
      -outline [set bg$crc] -width [expr {ceil(4*$zoom)}]]
    lappend coords2 {*}$xy2 $r
  }
  my HideIntersection $NP $type $coords2
  lassign $args font dotxt bgback
  if {$bgback ne {}} {
    # background pieces of "Puzzle"
    my BuildPuzzlePieces $NP ${type}bg $X $Y $shift $zoom $pieces $font 0 $bgback
    set args [list $font 1]
  }
  my BuildPuzzlePieces $NP $type $X $Y $shift $zoom $pieces {*}$args
}
#_______________________

method BuildPuzzlePieces {NP type X Y shift zoom pieces args} {
  # Builds a puzzle box's pieces.
  #   NP - name of puzzle
  #   type - box type
  #   X - x coordinate of box
  #   Y - y coordinate of box
  #   shift - pair of X, Y coordinates to shift the puzzle box
  #   zoom - zoom factor (0.1, 0.5, 1.0) for the puzzle
  #   pieces - list of pieces' data

  set font $FONTSMALL
  set dotxt yes
  set bgback {}
  if {[llength $args]} {lassign $args font dotxt bgback}
  foreach xy $pieces {
    incr ipce
    lassign [split $xy ,] x y _
    if {$bgback ne {}} {
      set outline $bgback
    } elseif {$_ ne {}} {
      set outline $FGCIRCLE2
    } else {
      set outline $FGCIRCLE1
    }
    set x [expr {($X+$x*$PCERADIUS)*$zoom}]
    set y [expr {($Y+$y*$PCERADIUS)*$zoom}]
    set xy2 [my CircleCoords $x $y [expr {$PCERADIUS*$zoom-1}]]
    set D(ID,$NP$type,pce$ipce) [$Wcan3 create oval $xy2 \
      -outline $outline -width [expr {ceil(4*$zoom)}]]
    if {$zoom>0.5 && [string is true $dotxt]} {
      set D(ID,$NP$type,txt$ipce) [$Wcan3 create text $x $y -text $ipce \
        -fill $outline -font $font]
    }
  }
}
#_______________________

method BuildAccessories {} {
  # Builds accessories (title, tools).

  $Wcan1 create text [expr {$WIDTH/2}] 30 -text $TITLE -fill $BGMSG -font $FONTLARGE
  set shift 40
  grid [button $Wcan2.but1 -image gluedcycles::runImage -bg $BGCANVAS \
    -activebackground $BGWAIT2 -highlightbackground $BGCANVAS \
    -highlightcolor $BGMSG -command "[self] Start"] -padx $MARGIN -sticky nsw
  grid [label $Wcan2.lab -text Level -fg $BGWAIT -bg $BGCANVAS] -row 0 -column 1
  grid [entry $Wcan2.but2 -fg $BGWAIT -bg $BGCANVAS -width 3 -insertbackground white \
    -textvariable [namespace current]::Level -highlightcolor $BGMSG \
    -justify center -validate key -validatecommand "[self] CheckLevel %d %P"] \
    -row 0 -column 2 -sticky w -padx 8
  grid [label $Wcan2.space -text { } -bg $BGCANVAS] -row 0 -column 3 -sticky ew
  grid columnconfigure $Wcan2 3 -weight 9
  grid [button $Wcan2.but3 -image gluedcycles::helpImage -bg $BGCANVAS \
    -activebackground $BGWAIT2 -highlightbackground $BGCANVAS -highlightcolor $BGMSG \
    -command "[self] ShowHelp"] -row 0 -column 4 -padx $Eps1
  grid [button $Wcan2.but4 -image gluedcycles::exitImage -bg $BGCANVAS \
    -activebackground $BGWAIT2 -highlightbackground $BGCANVAS -highlightcolor $BGMSG \
    -command "destroy $Win"] -row 0 -column 5
  grid [label $Wcan2.space2 -text { } -bg $BGCANVAS] \
    -row 0 -column 6 -padx [expr {$MARGIN/2 - 4}]
  grid [ttk::separator $Wcan2.separ -orient horizontal] \
    -row 1 -padx $MARGIN -pady [expr {$Eps1/2}] -columnspan 99 -sticky ew
  bind $Wcan2.but1 <Enter> "[self] Message {Starts puzzling} 9"
  bind $Wcan2.but2 <Enter> "[self] Message {To set the puzzle level from 1 to 8} 16"
  bind $Wcan2.but3 <Enter> "[self] Message {Helps with puzzling} 10"
  bind $Wcan2.but4 <Enter> "[self] Message {Ends puzzling} 8"
  foreach i {1 2 3 4} {
    bind $Wcan2.but$i <Leave> "[self] Message {}"
  }
}
#_______________________

method CircleCoords {x y r} {
  # Original coordinates of a circle.
  #   x - X of circle center
  #   y - Y of circle center
  #   r - radius

  list [expr {int($x-$r)}] [expr {int($y-$r)}] \
    [expr {int($x+$r)}] [expr {int($y+$r)}]
}
#_______________________

method HideIntersection {NP type coords2} {
  # Hides the intersection of two circles.
  #   NP - name of puzzle
  #   type - box type
  #   coords2 - coordinates & radiuses of circles

  lassign $coords2 x1 y1 x2 y2 r xR1 yR1 xR2 yR2 rR
  set iw [expr {$x2 - $xR1}] ;# width of intersection
  set d [expr {($r*$iw - $iw**2/2.) / ($r + $rR - $iw)}]
  set xR [expr {sqrt(2.*$rR*$d - $d**2) - 2}]
  set y [expr {($y1 + $y2)/2.}]
  set y1 [expr {$y - $xR - 0.5}]
  set y2 [expr {$y + $xR + 0.5}]
  set x1 [expr {$x2+2}]
  set x2 [expr {$xR1-2}]
  set D(ID,isec$NP$type) [$Wcan3 create polygon \
    $x1 $y1 $x2 $y1 $x2 $y2 $x1 $y2 -fill $BGCANVAS]
}


## ________________________ Managing _________________________ ##

method Start {{idk ""}} {
  # Starts the puzzle.
  #   idk - id of menu puzzle or index of the puzzle

  if {$idk ne {}} {my SelectPuzzle $idk}
  foreach id [array names D -glob *] {
    if {[string match *goal* $id] || [string match *puzzle* $id]} {
      $Wcan3 delete $D($id)
    }
  }
  my BuildPuzzleBox $D(puzzle) goal $BGSUCCESS $BGSUCCESS "420 130" 0.6
  my BuildPuzzleBox $D(puzzle) puzzle $FGCIRCLE1 $FGCIRCLE2 "530 20" 1. \
    $FONTLARGE yes $BGWAIT
  my ShufflePieces
  set Level [string index $D(puzzle) end]
}
#_______________________

method CheckLevel {d P} {
  # At changing the puzzle level.
  #  d - action (%d of validate)
  #  P - current value of entry (%P of validate)

  if {$d!=1 || $OldLevel==$P || $P<1 || $P>8} {
    if {$P ne {} && ($P<1 || $P>8 || ![string is digit $P])} {
      bell
      after idle "set [namespace current]::Level $OldLevel"
    }
  } else {
    set ans [tk_messageBox -title Level -parent $Win -type okcancel \
      -message "Changing the level to $P\nrestarts the puzzle."]
    if {$ans eq {ok}} {
      set OldLevel $P
      after idle "[self] Start P$P"
    }
    after idle "set [namespace current]::Level $OldLevel"
  }
  return 1
}
#_______________________

method SelectPuzzle {idk} {
  # Select puzzle of menu.
  #   id - id of menu puzzle or index of the puzzle

  set NP P[string index $idk [string first menu $idk]-1]
  if {$NP eq {P}} {set NP $idk}
  if {[info exists D(prevpuzzle)]} {
    my ColorMenuPuzzle $D(prevpuzzle) $BGCANVAS
  }
  my ColorMenuPuzzle $NP $BGPENDING
  set D(puzzle) [set D(prevpuzzle) $NP]
}
#_______________________

method ShufflePieces {} {
  # Shuffles puzzle pieces.

  if {$Level<1 || $Level>8} {set Level 1}
  set D(shuffles) [list]
  set numpce [llength [lindex $Circles($D(puzzle)) 6]]
  set D(idxpce) [split [string range 123456789 0 $numpce-1] {}]
  expr srand([clock milliseconds])
  for {set i 0} {$i<$Level*2} {incr i} {
    set shl [expr {int(floor(rand()*$numpce))}]
    for {set si 0} {$si<=$shl} {incr si} {
      set pce [expr {int(floor(rand()*$numpce))}]
      if {int(floor(rand()*2))} {set dir end} {set dir 0}
      set idx [lindex $D(idxpce) $pce]
      set D(idxpce) [lreplace $D(idxpce) $pce $pce]
      set D(idxpce) [linsert $D(idxpce) $dir $idx]
    }
  }
  for {set ipce 1} {$ipce<=$numpce} {incr ipce} {
    $Wcan3 itemconfigure $D(ID,$D(puzzle)puzzle,txt$ipce) \
      -text [lindex $D(idxpce) $ipce-1]
    set id $D(ID,$D(puzzle)puzzle,pce$ipce)
    set outline [$Wcan3 itemcget $id -outline]
    $Wcan3 itemconfigure $id -outline $BGCANVAS
    after 500 "$Wcan3 itemconfigure $id -outline $outline"
  }
}
#_______________________

method CurrentCoords {id} {
  # Current coordinates of a piece.
  #   id - piece's ID

  lassign [$Wcan3 coords $id] x1 y1 x2 y2
  list [expr {$x1-1}] [expr {$y1-1}]
}
#_______________________

method ColorMenuPuzzle {NP color} {
  # Colors puzzle of menu.
  #   NP - puzzle index
  #   color - color value

  $Wcan3 itemconfigure $D(ID,${NP}menu,crc1) -fill $color
  $Wcan3 itemconfigure $D(ID,${NP}menu,crc2) -fill $color
  $Wcan3 itemconfigure $D(ID,isec${NP}menu) -fill $color -outline $color
}
#_______________________

method End {} {
  # Checks if the puzzle is solved: all source pieces are fixed in target.
  # Returns 0 or id of found vacant source piece.

  for {set i 0} {$i<$SRCNUMBER} {incr i} {
    set src $D(Src,$i)
    # $D(busy,$src)==-1 means "piece is fixed in target"
    if {$D(busy,$src)==-1 && [incr succ]==$SRCNUMBER} {
      bell
      my Message {G R E A T!  YOU DID IT!}
    } elseif {!$D(busy,$src)} {
      return $src
    }
  }
  return 0
}

## ________________________ On events actions _________________________ ##

method OnButtonPress {key} {
  # Handles the mouse clicking a piece.
  #   key - key in D array for the piece

  lassign $D($key) id
  if {$D(busy,$id)<0} {                  ;# fixed piece: place it to source
    my Message {The move was undone}
    my PlaceToSource $id
  } elseif {[incr D(click)] in {2 3}} {  ;# one click: place it to target/source
    if {$D(dndXY) ne {}} {
      my OnButtonRelease
    } else {
      my PlaceToSource $id
    }
    set D(click) 0
  } else {                               ;# otherwise piece is moved
    $Wcan3 raise $id
    my ColorPiece $id $BGPENDING1 $BGPENDING2
    set D(dndXY) [list [winfo pointerx $Win] [winfo pointery $Win] $id]
    set D(dndtime) [clock milliseconds]
  }
}
#_______________________

method OnButtonMotion {} {
  # Handles the mouse moving over a piece.

  if {$D(dndXY) eq {}} return
  set dndtime [clock milliseconds]
  if {($dndtime-$D(dndtime))<30} {
    after idle "[self] OnButtonMotion" ;# to be in time with cursor
    return
  }
  set D(dndtime) $dndtime
  lassign $D(dndXY) x y id
  set x0 [winfo pointerx $Win]
  set y0 [winfo pointery $Win]
  set movX [expr {$x0 - $x}]
  set movY [expr {$y0 - $y}]
  $Wcan3 move $id $movX $movY
  set D(dndXY) [list $x0 $y0 $id]
  set D(click) 2
  if {(abs($movX)+abs($movY))>10} {  ;# this stops when cursor stops
    my OnButtonMotion
  }
}
#_______________________

method OnButtonRelease {} {
  # Handles the mouse releasing a piece.

  if {$D(click)<2} return
  lassign $D(dndXY) x y id
  set D(dndXY) {}
  set D(click) 0
  lassign [my CurrentCoords $id] x1 y1
  set mindist $WIDTH
  # get a target closest to the cursor
  foreach idov [$Wcan3 find overlapping {*}[$Wcan3 bbox $id]] {
    if {[string match *Trg* [$Wcan3 gettags $idov]]} {
      lassign [my CurrentCoords $idov] x2 y2
      set curdist [expr {sqrt(($x2-$x1)**2 + ($y2-$y1)**2)}]
      if {$curdist<$mindist} {
        set mindist $curdist
        set idtrg $idov
      }
    }
  }
  if {$mindist < $WIDTH} {
    my PlaceToTarget $id $idtrg
  } else {
    my PlaceToSource $id
  }
}

## ________________________ Messages _________________________ ##

method Message {msg {wait 20} {doit no}} {
  # Shows a message.
  #   msg - message's text
  #   wait - time to wait in 0.2 sec.
  #   doit - internally used by itself

  catch {  ;# the method can be called after destroying Puzzle object => catch
    set D(msg) {}
    catch {$Wcan4 delete $D(idmsg)}
    catch {after cancel $D(idafter)}
    if {!$doit} {
      after idle [list [self] Message $msg $wait yes]
      return
    }
    set D(msg) $msg
    set D(idmsg) [$Wcan4 create text [expr {$WIDTH/2}] 16 -text $msg \
      -fill $BGMSG -font $FONTSMALL]
    if {$wait} {
      set D(idafter) [after [expr {$wait*200}] "catch {[self] CheckMessage}"]
    }
  }
}
#_______________________

method CheckMessage {} {
  # Checks if there is a message. If so, erase it char by char.

  catch {  ;# the method can be called after destroying Puzzle object => catch
    if {[set len [string length $D(msg)]]} {
      set D(msg) [string range $D(msg) 0 $len-2]
      my Message $D(msg)
      after 4 "[self] CheckMessage"
    }
  }
}
#_______________________

method ShowHelp {} {
  # Shows rules etc.

  tk_messageBox -title $TITLE -parent $Win -message \
{The task of the puzzle is
to rotate "Puzzle" pieces so
that they compose "Wanted"
pattern, as for numbers.

The pieces are included in
two glued cycles: left and
right. Both are rotated
clockwise or counter.

To rotate a piece, you can
drag-and-drop it, or just click
it, then move and click again.
        ____________________

https://github.com/aplsimple}
}

  # ________________________ EOC _________________________ #

}

# ________________________ Run the puzzle _________________________ #

set gluedcycles::solo [expr {[info exist ::argv0] && \
  [file normalize $::argv0] eq [file normalize [info script]]}]

if {$gluedcycles::solo} {  ;# run as stand-alone app
  wm withdraw .
  set cnum [lindex $::argv 0]
  set dnum [set gluedcycles::defaultPieceNumber]
  if {$cnum eq {}} {set cnum $dnum}
  if {$::argc>1 || ![string is digit -strict $cnum] || $cnum<8 || $cnum>24} {
    puts "\nRun the puzzle this way:\n  wish [info script] ?PN? \
    \nwhere PN - number of pieces (8..24), by default $dnum\n"
    exit
  }
  gluedcycles::run . $cnum 1 yes
}

# ________________________ EOF _________________________ #
