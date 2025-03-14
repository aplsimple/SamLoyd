#! /usr/bin/env tclsh
###########################################################
# Name:    samloyd279.tcl
# Author:  Alex Plotnikov  (aplsimple@gmail.com)
# Date:    Dec 09, 2024
# Brief:   Handles Sam Loyd's math puzzle N 279.
# License: MIT.
###########################################################

package require Tk

namespace eval samloyd279 {

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

  image create photo samloyd279::runImage -data {iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAC+lBMVEUAAACBAABsAABiAwNkAAB/
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
  image create photo samloyd279::helpImage -data {iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAB8lBMVEUAAABngsVAOYZIV5hJUpVK
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
  image create photo samloyd279::exitImage -data {iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAC7lBMVEUAAACCAABpAACbAAChAABt
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

# ________________________ Class samloyd279::Puzzle _________________________ #

oo::class create samloyd279::Puzzle {

  variable TITLE SRCNUMBER TRGNUMBER PCERADIUS PI FONTLARGE FONTSMALL
  variable TTLHEIGHT TOOLHEIGHT MSGHEIGHT MARGIN HEIGHT WIDTH WIDTH1 WIDTH2
  variable BGSUCCESS BGPENDING BGPENDING1 BGBAD BGCANVAS BGWAIT BGMSG
  variable BGSUCCESS2 BGPENDING2 BGBAD2 BGWAIT2
  variable Win Solo OnePend Wcan1 Wcan2 Wcan3 Wcan4 D

constructor {wpar cnum onepend solo} {
  # Constructs and runs the puzzle.
  #   wpar - path to parent window
  #   cnum - number of pieces
  #   onepend - only 1 pending piece allowed
  #   solo - true, if runs as stand-alone app

  my variable WIDTH   ;# width of puzzle
  my variable HEIGHT  ;# height of puzzle (without accessories)
  my variable WIDTH1  ;# width of source
  my variable WIDTH2  ;# width/height of target
  my variable Win     ;# puzzle window
  my variable Solo    ;# if run stand-alone
  my variable OnePend ;# 1 pending piece allowed
  my variable D       ;# data of pieces

  # methods available only during the puzzle
  oo::objdefine [self] {
    export Message ShowHelp CheckMessage Start CheckOnePend \
      OnButtonPress OnButtonMotion OnButtonRelease OnPressTarget
  }
  # common data
  set npzl 279
  set Solo $solo
  set OnePend $onepend
  set TITLE "Sam Loyd's puzzle #$npzl"
  set FONTLARGE {Helvetica 26 bold}    ;# title font
  set FONTSMALL {Helvetica 14 bold}    ;# message font
  set SRCNUMBER $cnum                  ;# number of source pieces
  set TRGNUMBER [expr {$SRCNUMBER+1}]  ;# number of targets
  set PI 3.1415926536
  # sizes
  set PCERADIUS 28   ;# radius of piece
  set TTLHEIGHT 60   ;# height of title
  set TOOLHEIGHT 60  ;# height of tool bar
  set MSGHEIGHT 30   ;# height of message bar
  set MARGIN 32      ;# margin of source/target
  set HEIGHT [expr {$PCERADIUS*$TRGNUMBER*0.9 + $MARGIN*2}]
  set WIDTH2 [expr {$HEIGHT - $MARGIN*2}]
  set WIDTH1 [expr {$HEIGHT + $PCERADIUS*10 - $WIDTH2}]
  set WIDTH [expr {$WIDTH1 + $WIDTH2 + $MARGIN*3}]
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
  # build & run the puzzle
  set wpar [string trimright [winfo toplevel $wpar] .]
  set Win $wpar.samloyd$npzl
  toplevel $Win
  wm withdraw $Win
  my BuildMain
  my BuildSource
  my BuildTarget
  my BuildAccessories
  my Start
  bind $Win <Escape> "destroy $Win"
  bind $Win <F1> "[self] ShowHelp"
  bind $Win <Button> "[self] CheckMessage"
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
  pack [canvas $Wcan4 -width $WIDTH -height $MSGHEIGHT -bg $BGCANVAS \
    -highlightthickness 1 -highlightbackground $BGCANVAS]
}
#_______________________

method BuildSource {} {
  # Builds the source box.

  set X1 $MARGIN
  set Y1 [expr {$MARGIN*0.4}]
  set X2 $WIDTH1
  set Y2 [expr {$HEIGHT-$Y1}]
  set id [$Wcan3 create polygon $X1 $Y1 $X2 $Y1 $X2 $Y2 $X1 $Y2 \
    -outline $BGWAIT -width 3]
  set multy [expr {$PCERADIUS*2.6}]
  set shiftX [expr {$X1 + $PCERADIUS*1.6}]
  set shiftY [expr {$Y1 + $PCERADIUS*1.6}]
  for {set ic 0} {$ic<$SRCNUMBER} {incr ic} {
    set rm [expr {$ic%4}]
    set x [expr {int($rm*$multy + $shiftX)}]
    set y [expr {int($ic/4*$multy + $shiftY)}]
    set xy2 [my OriginalCoords $x $y]
    set id [$Wcan3 create oval $xy2 -fill $BGPENDING -outline $BGPENDING2]
    set D(Src$id) [list $id {*}$xy2]
    set D(Src,$ic) $id
    my BindSource $id $id
    set D(busy,$id) 0
  }
  $Wcan3 create text [expr {($X2+$MARGIN)/2}] [expr {$Y2/1.1}] \
    -text Source -fill $BGPENDING -font $FONTSMALL
}
#_______________________

method BuildTarget {} {
  # Builds the target carousel.

  # get center & radius of carousel
  set eps 8
  set cX [expr {$WIDTH - ($WIDTH2 + $MARGIN*3)/2 + $eps}]
  set cY [expr {$HEIGHT/2}]
  set cR [expr {$cY - $PCERADIUS - 2*$eps}]
  set cRC [expr {($cR - $PCERADIUS)/$cR}]  ;# for joints of lines
  # get targets & numerate them
  array set D [list]
  set sect [expr {2*$PI/$TRGNUMBER}]
  for {set ic 0} {$ic<$TRGNUMBER} {incr ic} {
    set x [expr {int($cX + $cR*cos($ic*$sect) - 10)}]
    set y [expr {int($cY + $cR*sin($ic*$sect))}]
    set D($ic,xy) [list $x $y]
    set xy2 [my OriginalCoords $x $y]
    set id [$Wcan3 create oval $xy2 -fill $BGWAIT -outline $BGWAIT2 -tag Trg$ic]
    set D(Trg$ic) [list $id $xy2]
    set D(busy,$id) 0
    set N [expr {(($ic+5)%$TRGNUMBER)+1}]  ;# numerate as shown in Loyd's book
    if {$N>9} {set x [expr {$x - 2}]}
    set y [expr {$y + 2}]
    set D(N$id) [$Wcan3 create text $x $y -text $N -fill $BGWAIT2 -font $FONTSMALL]
    $Wcan3 bind $id <ButtonPress> "[self] OnPressTarget $id"
    $Wcan3 bind $D(N$id) <ButtonPress> "[self] OnPressTarget $id"
  }
  # get move lines
  set D(Neighbors) [list]
  for {set ic1 0} {$ic1<$TRGNUMBER} {incr ic1} {
    set ic2 [expr {($ic1+2)%$TRGNUMBER}]
    lassign $D($ic1,xy) x1 y1
    lassign $D($ic2,xy) x2 y2
    set x1 [expr {$cX+($x1-$cX)*$cRC-1}]  ;# coordinates of lines
    set x2 [expr {$cX+($x2-$cX)*$cRC-1}]
    set y1 [expr {$cY+($y1-$cY)*$cRC-1}]
    set y2 [expr {$cY+($y2-$cY)*$cRC-1}]
    set id [$Wcan3 create polygon $x1 $y1 $x2 $y2 -width 3 \
      -fill $BGWAIT -outline $BGWAIT]
    set D(Trg$ic1,id1) $id
    set D(Trg$ic2,id2) $id
    lassign $D(Trg$ic1) id1
    lassign $D(Trg$ic2) id2
    lappend D(Neighbors) [list $id1 $id2]
  }
  $Wcan3 create text $cX $cY -text Target -fill $BGWAIT -font $FONTSMALL
}
#_______________________

method BuildAccessories {} {
  # Builds accessories (title, tools).

  $Wcan1 create text [expr {$WIDTH/2}] 30 -text $TITLE -fill $BGMSG -font $FONTLARGE
  set shift 40
  set pad 8
  grid [button $Wcan2.but1 -image samloyd279::runImage -bg $BGCANVAS \
    -activebackground $BGWAIT2 -highlightbackground $BGCANVAS \
    -highlightcolor $BGMSG -command "[self] Start"] -padx $MARGIN -sticky nsw
  grid [checkbutton $Wcan2.but2 -text {One pending only} -fg $BGWAIT -bg $BGCANVAS \
    -variable [namespace current]::OnePend -activebackground $BGWAIT2 \
    -activeforeground white -highlightcolor $BGMSG \
    -command "[self] CheckOnePend"] -row 0 -column 1 -sticky w
  grid [label $Wcan2.space -text { } -bg $BGCANVAS] -row 0 -column 2 -sticky ew
  grid columnconfigure $Wcan2 1 -weight 9
  grid [button $Wcan2.but3 -image samloyd279::helpImage -bg $BGCANVAS \
    -activebackground $BGWAIT2 -highlightbackground $BGCANVAS -highlightcolor $BGMSG \
    -command "[self] ShowHelp"] -row 0 -column 3 -padx $pad
  grid [button $Wcan2.but4 -image samloyd279::exitImage -bg $BGCANVAS \
    -activebackground $BGWAIT2 -highlightbackground $BGCANVAS -highlightcolor $BGMSG \
    -command "destroy $Win"] -row 0 -column 4
  grid [label $Wcan2.space2 -text { } -bg $BGCANVAS] \
    -row 0 -column 5 -padx [expr {$MARGIN/2 - 4}]
  grid [ttk::separator $Wcan2.separ -orient horizontal] \
    -row 1 -padx $MARGIN -pady [expr {$pad/2}] -columnspan 99 -sticky ew
  bind $Wcan2.but1 <Enter> "[self] Message {Starts puzzling} 9"
  bind $Wcan2.but2 <Enter> "[self] Message {Allows only one pending target} 16"
  bind $Wcan2.but3 <Enter> "[self] Message {Helps with puzzling} 10"
  bind $Wcan2.but4 <Enter> "[self] Message {Ends puzzling} 8"
  foreach i {1 2 3 4} {
    bind $Wcan2.but$i <Leave> "[self] Message {}"
  }
}

## ________________________ Managing _________________________ ##

method Start {} {
  # Starts the puzzle.

  # restore source pieces
  for {set i 0} {$i<$SRCNUMBER} {incr i} {
    set id $D(Src,$i)
    my ColorPiece $id $BGPENDING $BGPENDING2
    my PlaceToSource $id
    set D(busy,$id) 0
  }
  # restore targets
  for {set i 0} {$i<$TRGNUMBER} {incr i} {
    lassign $D(Trg$i) id
    set D(busy,$id) 0
  }
  set D(click) 0
  set D(dndXY) {}
  my Message {Moving pieces from Source to Target}
}
#_______________________

method VacateTarget {src} {
  # Vacates target and linked (possibly) source.
  #   src - id of source

  my ColorPiece $src $BGPENDING $BGPENDING2
  for {set i 0} {$i<$TRGNUMBER} {incr i} {
    lassign $D(Trg$i) trg
    if {$D(busy,$trg)==$src} {
      set D(busy,$trg) 0
      set D(busy,$src) 0
      $Wcan3 bind $D(N$trg) <ButtonPress> "[self] OnPressTarget $trg"
      $Wcan3 raise $D(N$trg)
    }
  }
}
#_______________________

method PlaceToSource {src} {
  # Places piece to source.
  #   src - id of source

  lassign $D(Src$src) -> x y
  $Wcan3 moveto $src $x $y
  set D(busy,$src) 0
  my VacateTarget $src
  my ColorNeighborLines
}
#_______________________

method PlaceToTarget {src trg } {
  # Places source piece to target.
  #   src - id of source
  #   trg - id of target

  set color1 $BGPENDING
  set color2 $BGPENDING2
  set oldtrg $D(busy,$src)
  if {$D(busy,$trg)} {
    if {$trg != $oldtrg} {my Message {This target isn't vacant}}
    if {$oldtrg} {
      my MoveToTarget $src $oldtrg $color1 $color2  ;# return to old target
    } else {
      my PlaceToSource $src  ;# return to source
    }
    return
  }
  my VacateTarget $src
  if {!$oldtrg} {
    set D(busy,$src) $trg  ;# flag "this target has to be fixed"
    set neighbors [my Neighbors $trg]
    if {![llength $neighbors]} {
      my Message {No moves for the piece}
      set D(busy,$src) -$trg   ;# flag  "2nd step impossible"
      set color1 $BGBAD
      set color2 $BGBAD2
    }
  } else {
    set neighbors [my Neighbors $oldtrg]
    if {$trg ni $neighbors} {
      if {$trg != $oldtrg} {
        my Message {The move isn't correct} ;# neighbors not available
        set D(busy,$src) $oldtrg
      }
      set trg $oldtrg
    } else {
      set D(busy,$src) -1    ;# flag  "this piece is fixed"
      set color1 $BGSUCCESS
      set color2 $BGSUCCESS2
      my End
    }
  }
  my MoveToTarget $src $trg $color1 $color2
  my ColorNeighborLines
}
#_______________________

method MoveToTarget {src trg color1 color2} {
  # Moves source piece to target.
  #   src - id of source
  #   trg - id of target
  #   color1 - fill color
  #   color2 - outline color

  lassign [my CurrentCoords $trg] x y
  $Wcan3 moveto $src $x $y
  set D(busy,$trg) $src
  my ColorPiece $src $color1 $color2
  $Wcan3 raise $D(N$trg)
  my BindSource $D(N$trg) $src
  # is only 1 pending piece allowed?
  if {$OnePend} {
    for {set i 0} {$i<$SRCNUMBER} {incr i} {
      set s $D(Src,$i)
      if {$D(busy,$s) ni {0 -1}} {
        if {$s!=$src} {set s0 $s}
        if {[incr pending]>1} {
          my Message {Only one pending target is allowed. Try the blinking target.}
          my PlaceToSource $src
          set fill [$Wcan3 itemcget $s0 -fill]
          $Wcan3 itemconfigure $s0 -fill $BGCANVAS
          after 500 "$Wcan3 itemconfigure $s0 -fill $fill"
          break
        }
      }
    }
  }
}
#_______________________

method ColorPiece {id color1 color2} {
  # Colors source piece and its possible target lines.
  #   id - ID of source piece
  #   color1 - fill color
  #   color2 - outline color

  $Wcan3 itemconfigure $id -fill $color1 -outline $color2
}
#_______________________

method ColorNeighborLines {} {
  # Colors pathes to neighbors.

  # through colors: normal (free cell), yellow (pending cell), red (bad cell)
  foreach color [list $BGWAIT $BGPENDING $BGBAD] {
    for {set i 0} {$i<$TRGNUMBER} {incr i} {
      lassign $D(Trg$i) trg
      set linecolor $BGWAIT
      set src $D(busy,$trg)  ;# id of placed source
      set flag [expr {$src ? $D(busy,$src) : 0}]
      set neighbors [my Neighbors $trg]
      if {$color eq $BGPENDING} {
        if {$flag>0} {
          if {[llength $neighbors]} {  ;# good cell?
            set linecolor $color
          } else {
            set linecolor $BGBAD       ;# no, it became bad
            my VacateTarget $src
            my PlaceToTarget $src $trg
          }
        } else {
          continue
        }
      } elseif {$color eq $BGBAD} {
        if {$flag<-1} {                ;# bad cell?
          if {[llength $neighbors]} {
            set linecolor $BGPENDING   ;# no, it became good
            my VacateTarget $src
            my PlaceToTarget $src $trg
          } else {
            set linecolor $color
          }
        } else {
          continue
        }
      }
      $Wcan3 itemconfigure $D(Trg$i,id1) -fill $linecolor -outline $linecolor
      $Wcan3 itemconfigure $D(Trg$i,id2) -fill $linecolor -outline $linecolor
    }
  }
}
#_______________________

method Neighbors {trg} {
  # Get available neighbors for a target (2, 1 or 0).
  #   trg - id of target

  set neighbors [list]
  foreach neib $D(Neighbors) {
    lassign $neib trg1 trg2
    if {$trg1==$trg && !$D(busy,$trg2)} {
      lappend neighbors $trg2
    } elseif {$trg2==$trg && !$D(busy,$trg1)} {
      lappend neighbors $trg1
    }
  }
  return $neighbors
}
#_______________________

method OriginalCoords {x y} {
  # Original coordinates of a piece.
  #   x - X of piece center
  #   y - Y of piece center

  list [expr {int($x-$PCERADIUS)}] [expr {int($y-$PCERADIUS)}] \
    [expr {int($x+$PCERADIUS)}] [expr {int($y+$PCERADIUS)}]
}
#_______________________

method CurrentCoords {id} {
  # Current coordinates of a piece.
  #   id - piece's ID

  lassign [$Wcan3 coords $id] x1 y1 x2 y2
  list [expr {$x1-1}] [expr {$y1-1}]
}
#_______________________

method CheckOnePend {} {
  # At changing "one pending only" mode.

  set title [$Wcan2.but2 cget -text]
  set ans [tk_messageBox -title $title -parent $Win \
    -type okcancel -message \
"$title = ON\
\nmakes the task harder.\
\n\
\nChanging the mode\
\nrestarts the puzzle."]
  if {$ans eq {ok}} {
    my Start
  } else {
    set OnePend [expr {!$OnePend}]
  }
}
#_______________________

method End {} {
  # Checks if the puzzle is solved: all source pieces are fixed in target.
  # Returns 0 or id of found vacant source piece.

  for {set i 0} {$i<$SRCNUMBER} {incr i} {
    set src $D(Src,$i)
    # $D(busy,$src)==-1 means "piece is fixed in target"
    if {$D(busy,$src)==-1 && [incr succ]==$SRCNUMBER} {
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
#_______________________

method OnPressTarget {trg} {
  # Places source piece on vacant target.
  #   trg - id of target

  if {!$D(busy,$trg) && [set src [my End]]} {
    $Wcan3 raise $src
    my ColorPiece $src $BGPENDING1 $BGPENDING2
    my PlaceToTarget $src $trg
  }
}
#_______________________

method BindSource {id src} {
  # Binds item to event, as a source piece.
  #   id - item id
  #   src - id of source

  $Wcan3 bind $id <ButtonPress> "[self] OnButtonPress Src$src"
  $Wcan3 bind $id <ButtonRelease> "[self] OnButtonRelease"
  $Wcan3 bind $id <Motion> "[self] OnButtonMotion"
}

## ________________________ Messages _________________________ ##

method Message {msg {wait 0} {doit no}} {
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
to move all pieces from
the source to the target.

Pieces are moved in 2 steps:
  - 1st move places a piece
  - 2nd move fixes it

The 2nd move has to be only
to a neighbor's neighbor
which is shown with lines.
E.g. (3) to (1) or (3) to (5).

To move a source piece, you
can drag-and-drop it. Or
just click it, then move to
a target and click again.
Or click a vacant target.
        ____________________

https://github.com/aplsimple}
}

  # ________________________ EOC _________________________ #

}

# ________________________ Run the puzzle _________________________ #

set samloyd279::solo [expr {[info exist ::argv0] && \
  [file normalize $::argv0] eq [file normalize [info script]]}]

if {$samloyd279::solo} {  ;# run as stand-alone app
  wm withdraw .
  set cnum [lindex $::argv 0]
  set dnum [set samloyd279::defaultPieceNumber]
  if {$cnum eq {}} {set cnum $dnum}
  if {$::argc>1 || ![string is digit -strict $cnum] || $cnum<8 || $cnum>24} {
    puts "\nRun the puzzle this way:\n  wish [info script] ?PN? \
    \nwhere PN - number of pieces (8..24), by default $dnum\n"
    exit
  }
  samloyd279::run . $cnum 1 yes
}

# ________________________ EOF _________________________ #
