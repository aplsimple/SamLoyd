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

  proc run {{w .} {rcfile ""} {solo no}} {
    # Runs the puzzle.
    #   w - parent window
    #   rcfile - .rc file
    #   solo - true, if runs as stand-alone app

    if {[string is digit $rcfile]} { ;# obsolete call
      set rcfile [file normalize [info script]]
      set rcfile [string range $rcfile 0 end-4].rc
    }
    [Puzzle new $w $rcfile $solo] destroy
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
  image create photo gluedcycles::undo -data  {iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAB2lBMVEUAAAAwKiozLS0AAABEJSU9
LCwtJyc7KSkyLCwxKysAAABMGxtQGBhCICA6MzMlISE6MzNRFRVLHh5CJiZIHx9HIyNDKChEIiJC
KSkvKSk8Ly8tJyc0Li42MDA6MzMpJCQAAAAAAABKHBxIICA+KCgzLS07JCQ5KCgsJyc+Kio2Ly81
Ly8PDQ3/iYmMGxv/zc3/x8f/w8P/hob/b2//sLD/qqr/goKyZmb/RUX/Pj5kGBhVExP/2Nj/ysr/
wMD1v7//vb3/ubn/trb/tLT/srL/mJj/k5PFfn7/cnL/TU3/Skr/QkJPGRn/5ub/2tr/vLz/p6f/
paX/pKT/oKD/nZ3/m5vYmZn/jY3/enr/d3f/Xl7/VlafTEyTQUFwIiJgHR1SFhaHExP/8fH/3Nz/
0dH/z8//xcX/ra3/oqLPjIz/fX3/dHT/aWn/ZGSoWVmyVlb/UlL/UVH/Ozv1NTWINDTYLCyyHx+B
FRX//Pz/4OD/09P109P/uLj1trbis7PrsrLira3ipaXrnp7/lZX1jo7Pfn68fn7/eHi8dnbYc3O8
cnL1cHCcPj7rPT2cNTWJLy+MLS19LCzFKiqCJiZuJibFJSWTHh5wGRlqExN9ERFkERGVEBB/EBBk
EBAatIq6AAAALXRSTlMAmQ8E0Z41py0gDPLvzG9ZP/Lv3NzPv7+vh39vaVxPFhQJ5eLIsrKMfHJm
VjxKEXURAAAB1UlEQVQ4y2JABkxiwhwMeICAUF85Ix55Kes2Pz3cCpgk4uoqbHAr4BCJrU5KSsWp
gC/BvNLX19dAz0ecjwmL8axWYcnJfn42NjYNHSU+rJzoxov221elpKTq69va2hqkNfXw8KHIy/Lk
G9gaGKQZGtrZOfg71jg5d06XQLKH1arV0BAo4+/o5OxiYpJuahoQ2FLOglDh4+5sApIDSQUGZQSH
hLo2u4VPY2GGKdCMd3d0DQkMgMi5uYWH6xoZmXXPYYcboc0dY+hqZKQLAiC5iGyP3KiC3lmycBWc
LBPrA8yyIiI9jHNycqOioqMLPb0sJnHLw1Uws8ZnOuiCFOjr6zuFZoMVeCeqI3lVSzDPwA2oQM/a
KrbL3sEYpKCUGznAAGNjKbE3bTfWU+WXFLbOsw8qsPC2nCmNEtzsVmF2ZqDIUmRTsQpz8fS2nCqi
iBKiMgnm+hMYwW6SEXR38bIstmZDjRM25djJjFAmj3uwZVGiJFqsybPz8sOSn3VjVlGZODOaCmYF
eBRIxRlalCop4EmiouZmxQkc+NJ4fK3lXH58uUDM3DhRA58CuSkmsxkZ8AGhzDJGZnwKWGPy2bnw
2hFnzotXAYNPDAEFLDPU8CvglNZhBgDOxma2VxaO8gAAAABJRU5ErkJggg==}
  image create photo gluedcycles::redo -data {iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAB2lBMVEUAAAA6MzMAAAAAAAA2LS0h
HBwPDQ0AAABIMzM+MjI9MzMAAAA6MzMAAABIMjJCMzNCMzM9Ly87MzMrJiYoIyM7MzM6MzMAAAAA
AABEMTE/MDA1LCwzKiowKCgYFRU6MzM6MzNCMTFEMzM/MzM9MzMzLS06MzMAAABRMzP/pBZNMzP/
5LVJMzP//5n/15P/04rf2IX/u0L/uT5YPzn/qR3/oRH/nQf/893/68n/5rv/4Kj/3qT/3KD/znz/
ynT/xGH/wV1xWUb/nw3/7c3/6L//4rD/253/2pr/2pX/+5P/15D/1I7/0oH/6nzKv3n/zXehjF//
xF2Wf1n/wVR/ZkxmSj//tjpbPjdcOjL/siz/rSnAdRj/+Oz/4KvVvKDq5Yz/8Yn/0YX/z4DAsnL/
yG7/32r/yGn/3Gb/1mb/xWb/x1b/ylH/vU16Zkz/vUn/uEX/xEJzUED/tDb/szOKVCbqkRD//vz/
9OL06Nf03LXfy7T/25j08pLqyZH07In06Ij/24LKqYDVzH/Vrn+rjnr/43f/33b/5nShgnGrmWah
fmPfqmK1iVyKaVr/0FnfpVO1hU9/XEpvWUZnSUTfnUBXOTF6Ui9lPyxzRir/qyOWWyOhYB7VgA/0
lQlx74ncAAAAKHRSTlMAPwMnslk8HO+wnxUPCfLfz8x/f3JvXy0N5dilmYtMLx/lv7+PWU8G8Tuy
bgAAAdhJREFUOMtiwADK/IwM+ACj1gQtUbwKNNyqQjl58ClwL6vo5ZfHo0AvJqa8RQeHNWKcHBr6
5kAQF8GFxRohjskdcRZA4OzsXDlRQB7dcP7CZm0QsLS0dHFxseziEEORF9Xq0XOzsbG2trKKjXV1
ddXWbgznQpLniujW1/f29tLT83B3hyqsLRTggVsf0W9n529rm5SUmAhU6OWl51Ht0VAfygqVV5s6
xcHBPjMzLSUFrM7Hx8c/rc3AUZANIs/DEa0ZVZSfnxMMVGYfaB8YGByclZBsLCPOC3VAiammponJ
zKioyOKiMCNDw7ycDM8gPhFmJlgElYIVFPf56urqZoMUtMY7Sslxw1zIOcsJqCAyVdcvaJKWBtCE
rAQ/Y2mg8VAAmIJWKVBBtm5yqKS0iCxQQYZnAJ8wMxMihEvMnEzT40MUhZm5mRg1jHxrQqRY2ZHC
SCDazCndIJyFTQIcm55NxhAmwoa5ZgUG4bIQMxm1OnUgxiOieIaZSZ0jC0yQUxBiPAKozDZrDxAU
h2li4pZAi2al6EgDHTle3KlQZ05qiAw7Ax4FmgZ8bEz4knFBEAs+Axin+xqzquNTMM1PkhlvVsoN
YOHGr8BRhBevAmMdNga8QJUVnx8AecZkFWbl0sMAAAAASUVORK5CYII=}

  image create photo gluedcycles::download -data  {iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAABtlBMVEUAAADDAADLAAC5AADzAAGO
OSWkAQDYAACQOCWyAgC4AADqAAKNMh+KKxjHAwfcAATuAALNAAKFKBKPNSKMMBuIKBSSNybnAAWK
FQZ7EwB9IQiHCwCNNiGKFQOONiOfEQi1BQKvMTP/GTHlGSm1GR/XFB7KEhvZCxKxFxe2DAmNDgST
JhisCQCXCQCQKxyjBgChBACNCgCLCAB4DgB7EwByDwCNCgCBCgB6FQCIJBGPCwB/DwCJDgCLDgCB
DwCQDQCiCQCJFQN3HQJ2EwCdCwClAACIFAWKJxWeCgL/AAnFRFT/AAvEPU/COErAMUXALUHDOEzB
NEfhAAb/AAXkAAXEQFK+Jjr6AAXPYnDMWWi+Kz69Kj69Jzq8Izi8Ize6IDS8HzPAGjDFGTDXABHx
AAnrAAjKaW/IaG7LVWTITFzMFS29EinDESnMDyjzAAjVAAfLcHfKZ23OXWvKUWLGSFnFQVPHOkz/
FDbYHzHsFi3RECr/AiTTCSP9ABXLABHeAAfRAAfKUF7EO07YMkb/HDf2HDb1Gja7HzW6HDLCGjC4
Fiz/Ciy3ESf/ACDNAx7hABzDABS+AAZZegiIAAAASXRSTlMAHyIi/qA6/lwfBP6goP7+/v7AoKCf
XP7lwL+mXFw0EQn+/v7+/v79/Pfx7+/q5+LY0szBv7+/s6ifk46DdWVURUQ2NjAvIh8Z5OAZcgAA
AZFJREFUOMt90WVTAkEAxvG1OA8UBRW7u7u7PfCMEz1QUBokpTvsrm/sEjOEe/ze3Nw8/5md2QVp
LU2lAoGgFGpqASglNzqdzq7X6+03JehAIkyRMAVu92ncvqQKHTj2k+4c6KBKepRESsuQQZmUJI8T
DAyB4SDFUI0Mqp2HKU50UH57Dl1A1+Xo4Fomk51BMoagxiWXyy8huasGHQivIIXiWSGcz902Gvh8
/ojwRal8ValUSk9dff3U9GZm0QDvgDxTqoxGy1eE+2M2fZCTINPuIPlmMhsDIbXNZovxuL+mgR2Q
pbldYbYE1BWUWExFsVikawXkmPNYQmqqVquxarTiqG8W5Gqtu1dTWitNEASt8Q/vgX/W+761ViIh
3LMKEBZ9muQuemwEKG3jT4QIziLvaCtA2uoPiuD+2bsGGCx3hmHRsQAYzTwQhHesjTnAh96DXBbI
o7nbvwTyapxgAxQ2jhckbLOSXxzPDlk8DL4Tp7IYquTUUhUYj5UdYPGVPkmg6WKOGMsO2EVQYRr8
Sx3xB7pYbPmwceGrAAAAAElFTkSuQmCC}
  image create photo gluedcycles::upload -data {iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAABy1BMVEUAAAAhYBQaWw4wgwoZWg46
jwk2hwgkYxw4jAkeXhYtfQkseQkoZR8iYRcdXhEwfQg7fSY1fhQ+gSeDt2JhmUk8dSwufwkpdAkf
XhcmcQhDgzAncwdMiTaRxm2HvmNrpktikEpil0Vwr09tqFJZk0U/fSwxbCQqaBxGhjI+eC9EhDM6
dy08eDE6eC0ZWhMqaR4zcCkoZR8tbiEmZBwzdSYraiI2dSsygQg0dCgpZx09fC8saCIycyM9gCoz
cCYxbCNVmDo4dgZZjTBRhjBZjC9doSZXmCJJghtjlDtjqStQjR5ol0KC1z590Dp4yDd1xDZyvzRv
vDJrti9ioC9psy1krCpanSVWkiQ5eAeW02aT1l59sVWG0EqJ3kWH20SE1URmlkB4wT5pnT58zD15
xT1zujtlmTtajDtvtjZmrS5cmSxhpSpUjiZVlSJOhyBKiRdGgBdCfRI/ew9exgpcxApbwQpZvQlX
uAlUtAlSrghPqQiZ0m2c3GqPyGOAp2OLx157o1t6plqMzViP3VKAvFCH1Ul5tEltmkhsmUeAzUOA
0T9ekDZttDRqrjRoqDRhmzFpsDBlpzBajzBblC1UiipcnihalyhKoAhJnwh0sSA1AAAAQXRSTlMA
XKDEn35+wH41xMTAn59+HxkR/vrwxMTAOjMqBv7+/v7+/frv6ufn4uLY0sy/v7OoqKOfk46DfnVl
XFxURUQiCratGZAAAAFkSURBVDjL1dHVVgJhFIbhsYZUxBawu7sTlJLuVOlOaezuzst1XLBcgD/D
sc/p9x7tDaWQSSQYhrHYsh9YLAzPkMhQpsavZCIei0bCoVA4Eo3FE8nPxqyAWk8g4OtK0urweEI9
FQKqqoTQjQ7SUPf56qZptL2yU6PtoKAEQ7v6873+1bz7bLN+e2tTM5lvp9ScXCPBafsSeKcN7FvM
N3w+X9tbBQymqq1Gi1kgEAgPx0H7cs2FwyoWCYUikbFlEXDCPt3D/Z1DIhZLJNKzLvKfYOz4Ufbs
fJJLpXK5k6sbyd0XWjmvLpmby1UoFFw3U9Y2l3PC2ss3j+pD+c5EKJUslal2JSvAHPB4hhePystC
eF0mG+eoIXPHNRCJxO4rn28D4ffbejAYzDAOyjHBYyOCajWdUQGBlBvYgaCajmCUggNOYAdZ0QJk
TwXFwKDill4gYBQIStf/Q2BfS7ODA1zRr4w/fQNkhWUc/DEvJAAAAABJRU5ErkJggg==}
  image create photo gluedcycles::sos -data {iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAADAFBMVEUAAAAAAAAcCgoOBwcAAAAH
BAQ6FBMcDQ0AAAAAAAAAAAACAAAAAQEiERFJHh44FBIxERBvIiI8HR1oIiEnCAckCwsFAQEtDAwA
AABrMzOYEBGLTlNyNjibODhxMTNUKyukU1OHERFtLy8nEhJcKShsKCcrBwdCJSV+CQkgCAgsERAN
BQWPBgYAAABhKSldLSyfKSm/fn6VHx9aLzCWHR2ULS11EBB9CgptCAiODg5mDQ2cSEh7FBRwERGX
RERzDg6SMjIvGhqEJSU9AABLBAROBQU0EA+NDg6JMDB9BgZBFBRCAACBLCxqIyM/GBgLAACKAAB5
AAB7BAQHAwNYJCIDAgI7EhJnLi4AAAAPBAMAAABnHR1gJyZjKykAAAD+/v77///6+/u8wNSdAAD/
///8/P2aAAD4/v709fX5+fn3+fn1+Pjn5+7c3OXU1uH+AQG+AADi4+vHyNi/wta5vtG7u8y4ucy3
t8r4xMSHFRXMDQ3KAACyAACkAADv/f78+/v49ffy8fTN0uHS0t3Ey93LytjDxtfAv9C5rL74sLCs
naylipXxj4+ddoCTdHytbnTzPz9lMjLrKCikCQn1///z8/bs7/T47+/s6+/e5eX44eHT3t712di3
wtf50tLZw8PvwsLnwcH5vr7ttrevorHwo6SmkqDHnJz6m5v1l5eyi5HIj4/8iYmYeoTsg4O0dHT4
c3OQZ26MZWzxYWHmX1+NV113SEv1SEh0QELlQEByLy9lKyrjKiqiHB+PCgqVAwP3AQGrAQHwAADS
AAC3AACoAADj8vzq8/r78vLg5u/66ene3ufm4+O8xtzGu8jDuMbAtcS4s8PUusK3sMK9vb3CvLzV
tbXPrq7cpKy2nanUqKj6pqbumprSlZmwmJjblZWfgInWe3/6fHy9bW3oZmbTZGWFXWKlUVrFVlmT
U1fLVFSuVFTAUlKmRErgSEiCOz67NDS9Ly+PIiR3IyPBISHZIB/fHRz/FxfqFxfDFhavExb6DQ3D
BwfNBgXeBQXpAACldJ6SAAAAX3RSTlMAOwVAGRLYtmg1JxUOCOrSxo6OgYBUTkst/f38+vXw8O3n
4sq+u7OurKqilkYgFP79+/v59vXx7+zk497e3trZ1NPRy8nEwL+8u7m5tKCcm5aUiYmIfXFhX15X
TkhCDAQBcuoAAAKUSURBVDjLYhhcQC9a0MNaQcHOR1CcFZu0sMPqhbNO1NdPn7PQ0CkMQ0m4ZVVP
SkJ6dnZ2VkJK/eY/NqJMyNK8gpN3rtiwckoGGGQ/WrNmj5QQD0IeICbfg1tWTjr0u6Ju5uzZM+tu
5x/YvmLnZD+ECuH+xev+/T+Qv+XKqv71965u/p5/6MfSGy9FYLbESOemn+qZlL/ng5GVi6utwZsJ
+RM6G46dlxODKlC9eTIzPn16z0cLTQ5GCUYRxVedWQnxOU29Xixg+VjposLE1Ib0+Wb+zHEgAVHT
MwmJQAUdMpEQF/S2ABVkpT92FoNaqnErITE1p7VkqxYr2IZlRadBCl6rcUHtDFodD1RQlNTrBhZR
6mrLzY7PTFjvrQtVoHEdqKCwLambnxPEBUhuSVJzY0pCwn1zUYi8jsmClJSG3PakbjZGiAklrdNS
5i2YcMRenAkkr1i9oWJWXV558QOIApXusy2Xnla9WzTpi6xnYIC7bNX2Rd++Pjw3t2WTANiKkI0d
zyfXFPy9U1Ex49ry5fMbO+c9OVxd8Ku/Yxu7BEgBs4xUWtrRIwVVixMSE+LjgcQ6oHxNbfIn42AW
cFSpVCanJR+t+TknJTEzMzMxNWUpSD4t7bNjFC/Y1eKS+4Aqau9OSYwHgdSs4y8O1qYlV8prwwJG
aNf+5P1vm3ILZzROnTotJzfvwl6g/ER2MVh0Asaqvmvf3ssl7UXNeXl5za3t5XNXAeWVObjhCYJb
fffW0uKSsvLS0tKy8rKktiXv9ZU5gC5EqBCS39HXVVacBATFF5dtlORjjwDLI1IlsxbfxG2b+tau
7Xu2YzcfeygzD3q6ZmUW0RTgZ2PjF1DT5mCEWY9qCgsXJyMjI6eELg81MyQAV0b9atWTQ0sAAAAA
SUVORK5CYII=}
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

  variable TITLE PCERADIUS FONTLARGE FONTSMALL
  variable TTLHEIGHT TOOLHEIGHT MSGHEIGHT MARGIN HEIGHT WIDTH
  variable BGSUCCESS BGPENDING BGCANVAS BGWAIT BGMSG BGMSG2
  variable BGPENDING2 BGWAIT2 FGCIRCLE1 FGCIRCLE2
  variable Win Level Difficulty OldDifficulty Rcfile Solo
  variable Wcan1 Wcan2 Wcan3 Wcan4 D Circles Pieces Eps SavedState

constructor {wpar rcfile solo} {
  # Constructs and runs the puzzle.
  #   wpar - path to parent window
  #   rcfile - .rc file
  #   solo - true, if runs as stand-alone app

  my variable WIDTH    ;# width of puzzle
  my variable HEIGHT   ;# height of puzzle (without accessories)
  my variable Win      ;# puzzle window
  my variable Solo     ;# if run stand-alone
  my variable Level    ;# level
  my variable D        ;# data of pieces
  my variable SavedState    ;# data keys of saved state
  my variable Difficulty    ;# level difficulty
  my variable OldDifficulty ;# old difficulty
  my variable Rcfile   ;# .rc file

  my variable Circles  ;# data of circle pairs

  my variable Eps        ;# epsilon for circles
  my variable FGCIRCLE1  ;# color of 1st circle
  my variable FGCIRCLE2  ;# color of 2nd circle

  # methods available only during the puzzle
  oo::objdefine [self] {
    export Message ShowHelp CheckMessage Start CheckDifficulty ShufflePieces SOS \
      HideArrows State SaveState UndoRedo ShowMove End \
      OnButtonPress OnButtonMotion OnButtonRelease
  }

  # Data of circles & pieces:
  # 1 row: radius,X,Y of left circle
  # 2 row: radius,X,Y of right circle
  # 3 row: coordinates of pieces
  # 4 row: pieces of two circles clockwise
  array set Circles {
    P1 {
      2.5  2.5  2.6
      4.9  2.5  1.8
      {1.6,1.6  3.6,1.6  5.4,2.6,=  1.6,3.6  3.6,3.6}
      {1,2,5,4  2,3,5}
    }
    P2 {
      2.5  2.5  2.7
      4.4  2.5  2.7
      {1.6,1.6  3.6,1.6  5.6,1.6,=  1.6,3.6  3.6,3.6  5.6,3.6,=}
      {1,2,5,4  2,3,6,5}
    }
    P3 {
      2.8  2.5  2.7
      5.7  2.5  2.4
      {1.7,2.6  3.1,1.1  4.5,2.6  6.3,1.6,=  3.1,4.1  6.3,3.6,=}
      {1,2,3,5  3,4,6}
    }
    P4 {
      2.8  3.0  3.0
      5.7  3.0  2.1
      {1.2,3.1  2.5,1.5  4.5,2.0  6.3,3.1,=  2.5,4.7  4.5,4.1}
      {1,2,3,6,5  3,4,6}
    }
    P5 {
      2.8  2.5  2.8
      5.3  2.5  2.8
      {1.4,2.6  2.8,1.1  4.2,2.6  5.6,1.1,=  7.0,2.6,=  2.8,4.1  5.6,4.1,=}
      {1,2,3,6  3,4,5,7}
    }
    P6 {
      2.8  3.0  3.0
      5.7  3.0  2.4
      {1.5,2.0  3.4,1.5  4.6,3.1  6.35,2.05,=  1.5,4.1  3.4,4.7  6.4,4.1,=}
      {1,2,3,6,5  3,4,7}
    }
    P7 {
      2.8 3.0 3.0
      5.2 3.0 2.9
      {1.2,3.1  2.5,1.5  4.5,2.0  6.6,2.0,=  2.5,4.7  4.5,4.1  6.6,4.1,=}
      {1,2,3,6,5  3,4,7,6}
    }
    P8 {
      2.8 2.8 3.1
      5.1 2.8 3.1
      {1.0,2.9  2.2,1.2  4.1,2.0  6.0,1.2,=  7.1,2.9,=  2.2,4.6  4.1,4.0  6.0,4.6,=}
      {1,2,3,7,6  3,4,5,8,7}
    }
  }
  # common data
  array set D [list]
  set Solo $solo
  set Level [set Difficulty [set OldDifficulty 3]]
  set Rcfile $rcfile
  set Eps 8
  set SavedState {puzzle idxpce orig,idxpce wanted SOS History Move end}
  set TITLE {Glued cycles}
  set FONTLARGE {Helvetica 26 bold}  ;# title font
  set FONTSMALL {Helvetica 14 bold}  ;# message font
  # sizes
  set PCERADIUS 50   ;# radius of piece
  set TTLHEIGHT 60   ;# height of title
  set TOOLHEIGHT 60  ;# height of tool bar
  set MSGHEIGHT 30   ;# height of message bar
  set MARGIN 40      ;# margin of puzzle
  set HEIGHT [expr {$PCERADIUS*7.3}]
  set WIDTH [expr {$PCERADIUS*18 + $MARGIN*2}]
  #colors
  set BGCANVAS black      ;# canvas background
  set BGSUCCESS  #379737  ;# successful piece
  set BGPENDING  #aaaa00  ;# pending piece
  set BGPENDING2 #8c8c4c  ;# border of pending piece
  set BGWAIT     #888888  ;# piece waiting
  set BGWAIT2    #464646  ;# border of pieces waiting
  set BGMSG      #ff6bff  ;# message
  set BGMSG2     #b14eb1  ;# message
  set FGCIRCLE1  #804000
  set FGCIRCLE2  #b07030
  # build & run the puzzle
  set wpar [string trimright [winfo toplevel $wpar] .]
  set Win $wpar.gluedcycles
  toplevel $Win
  wm withdraw $Win
  expr srand([clock milliseconds])
  my BuildMain
  my BuildPuzzle
  my BuildAccessories
  my Start
  my State rR
  my Message {Composing "Wanted" pattern in "Puzzled"}
  bind $Win <Escape> "destroy $Win"
  bind $Win <F1> "[self] ShowHelp"
  update
  wm resizable $Win 0 0
  ::tk::PlaceWindow $Win widget $wpar
  wm deiconify $Win
  tkwait visibility $Win
  tkwait window $Win
}
#_______________________

method level {{level ""}} {
  # Gets/sets the puzzle level.
  #   level - puzzle level

  if {$level ne ""} {set Level $level}
  return $Level
}
#_______________________

method difficulty {{difficulty ""}} {
  # Gets/sets the puzzle difficulty.
  #   difficulty - puzzle difficulty

  if {$difficulty ne ""} {set Difficulty $difficulty}
  return $Difficulty
}

## ________________________ GUI _________________________ ##

method BuildMain {} {
  # Builds main frames of the puzzle.

  set Wcan  $Win.can
  set Wcan1 ${Wcan}1  ;# title
  set Wcan2 ${Wcan}2  ;# tools
  set Wcan3 ${Wcan}3  ;# puzzle
  set Wcan4 ${Wcan}4  ;# messages
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
  set D(puzzle) P$Level
  set zoom 0.2
  set margin [expr {$MARGIN/$zoom}]
  my BuildPuzzleBox P1 menu $FGCIRCLE1 $FGCIRCLE2 "$margin $MARGIN" $zoom
  my BuildPuzzleBox P2 menu $FGCIRCLE1 $FGCIRCLE2 "700 $MARGIN" $zoom
  my BuildPuzzleBox P3 menu $FGCIRCLE1 $FGCIRCLE2 "$margin 380" $zoom
  my BuildPuzzleBox P4 menu $FGCIRCLE1 $FGCIRCLE2 "700 350" $zoom
  my BuildPuzzleBox P5 menu $FGCIRCLE1 $FGCIRCLE2 "$margin 750" $zoom
  my BuildPuzzleBox P6 menu $FGCIRCLE1 $FGCIRCLE2 "700 730" $zoom
  my BuildPuzzleBox P7 menu $FGCIRCLE1 $FGCIRCLE2 "$margin 1100" $zoom
  my BuildPuzzleBox P8 menu $FGCIRCLE1 $FGCIRCLE2 "700 1130" $zoom
  $Wcan3 create text 130 350 -text "Selected" -fill $BGPENDING -font $FONTSMALL
  $Wcan3 create text 370 350 -text "Wanted" -fill $BGSUCCESS -font $FONTSMALL
  set D(PuzzledLabel) "Puzzled"
  set D(PuzzledID) [$Wcan3 create text 750 350 -text $D(PuzzledLabel) \
    -fill $FGCIRCLE2 -font $FONTSMALL]
  foreach idk [array names D -glob *menu*] {
    $Wcan3 bind $D($idk) <ButtonPress> "[self] Start $idk"
  }
  my HighlightPuzzle $D(puzzle)
}
#_______________________

method BuildAccessories {} {
  # Builds accessories (title, tools).

  $Wcan1 create text [expr {$WIDTH/2}] 30 -text $TITLE -fill $BGMSG -font $FONTLARGE
  set shift 40
  set pad2 [expr {$MARGIN/2 - 2}]
  grid [button $Wcan2.butRun -image gluedcycles::runImage -bg $BGCANVAS \
    -activebackground $BGWAIT2 -highlightbackground $BGCANVAS \
    -highlightcolor $BGMSG -command "[self] Start {} false"] -padx $MARGIN
  grid [label $Wcan2.lab -text Difficulty -fg $BGWAIT -bg $BGCANVAS] -row 0 -column 1
  grid [entry $Wcan2.butEnt -fg $BGWAIT -bg $BGCANVAS -width 3 \
    -highlightcolor $BGMSG -insertbackground white -textvariable \
    [namespace current]::Difficulty -justify center -validate key \
    -validatecommand "[self] CheckDifficulty %d %S"] \
    -row 0 -column 2 -sticky w -padx 8
  grid [label $Wcan2.space -text { } -bg $BGCANVAS] -row 0 -column 3 -sticky ew
  grid columnconfigure $Wcan2 3 -weight 9
  grid [button $Wcan2.butUndo -image gluedcycles::undo -bg $BGCANVAS \
    -activebackground $BGWAIT2 -highlightbackground $BGCANVAS \
    -highlightcolor $BGMSG -command "[self] UndoRedo -2"] -row 0 -column 4
  grid [button $Wcan2.butRedo -image gluedcycles::redo -bg $BGCANVAS \
    -activebackground $BGWAIT2 -highlightbackground $BGCANVAS \
    -highlightcolor $BGMSG -command "[self] UndoRedo 0"] -padx 4 -row 0 -column 5
  grid [label $Wcan2.spaceDo -text {} -bg $BGCANVAS] -padx $pad2 -row 0 -column 6
  grid [button $Wcan2.butUp -image gluedcycles::upload -bg $BGCANVAS \
    -activebackground $BGWAIT2 -highlightbackground $BGCANVAS \
    -highlightcolor $BGMSG -command "[self] State w"] -row 0 -column 7
  grid [button $Wcan2.butDown -image gluedcycles::download -bg $BGCANVAS \
    -activebackground $BGWAIT2 -highlightbackground $BGCANVAS \
    -highlightcolor $BGMSG -command "[self] State r"] -padx 4 -row 0 -column 8
  grid [label $Wcan2.space2 -text {} -bg $BGCANVAS] -padx $pad2 -row 0 -column 9
  grid [button $Wcan2.butSOS -image gluedcycles::sos -bg $BGCANVAS \
    -activebackground $BGWAIT2 -highlightbackground $BGCANVAS -highlightcolor $BGMSG \
    -command "[self] SOS"] -row 0 -column 10
  grid [button $Wcan2.butHelp -image gluedcycles::helpImage -bg $BGCANVAS \
    -activebackground $BGWAIT2 -highlightbackground $BGCANVAS -highlightcolor $BGMSG \
    -command "[self] ShowHelp"] -row 0 -column 11 -padx 4
  grid [label $Wcan2.space3 -text {} -bg $BGCANVAS] -padx $pad2 -row 0 -column 12
  grid [button $Wcan2.butExit -image gluedcycles::exitImage -bg $BGCANVAS \
    -activebackground $BGWAIT2 -highlightbackground $BGCANVAS -highlightcolor $BGMSG \
    -command "destroy $Win"] -row 0 -column 13
  grid [label $Wcan2.space4 -text {} -bg $BGCANVAS] -padx $pad2 -row 0 -column 14
  grid [ttk::separator $Wcan2.separ -orient horizontal] \
    -row 1 -padx $MARGIN -pady [expr {$Eps/2}] -columnspan 99 -sticky ew
  bind $Wcan2.butRun <Enter> [list [self] Message \
    "Restarts the current puzzle of level \[[self] level\]"]
  bind $Wcan2.butEnt <Enter> "[self] Message {Sets the level difficulty from 1 to 9}"
  bind $Wcan2.butUndo <Enter> "[self] Message {Undo}"
  bind $Wcan2.butRedo <Enter> "[self] Message {Redo}"
  bind $Wcan2.butUp <Enter> "[self] Message {Saves the puzzle}"
  bind $Wcan2.butDown <Enter> "[self] Message {Restores the saved puzzle}"
  bind $Wcan2.butSOS <Enter> "[self] Message {Shows a stupid solution, move by move}"
  bind $Wcan2.butHelp <Enter> "[self] Message {Helps with puzzling} 20"
  bind $Wcan2.butExit <Enter> "[self] Message {Ends puzzling} 10"
  foreach i {Run Ent Undo Redo Up Down SOS Help Exit} {
    bind $Wcan2.but$i <Leave> "[self] Message {}"
  }
  my State rC
}

### ________________________ Puzzle Box _________________________ ###

method BuildPuzzleBox {NP type bg1 bg2 shift zoom args} {
  # Builds a puzzle box.
  #   NP - name of puzzle
  #   type - box type
  #   bg1 - outline color of 1st circle
  #   bg2 - outline color of 2nd circle
  #   shift - pair of X, Y coordinates to shift the puzzle box
  #   zoom - zoom factor (0.1, 0.5, 1.0) for the puzzle

  lassign $shift X Y
  lassign $Circles($NP) X1 Y1 R1 X2 Y2 R2
  foreach crc {1 2} {
    set x [expr $X+[set X$crc]*$PCERADIUS+$Eps]
    set y [expr $Y+[set Y$crc]*$PCERADIUS+$Eps/2]
    set r [expr [set R$crc]*$PCERADIUS+4]
    foreach v {x y r} {set $v [expr [set $v]*$zoom]}
    set xy2 [my CircleCoords $x $y $r]
    set D(ID,$NP$type,crc$crc) [$Wcan3 create oval $xy2 -fill $BGCANVAS \
      -outline [set bg$crc] -width [expr {ceil(4*$zoom)}]]
    lappend coords2 {*}$xy2 $r
  }
  my HideIntersection $NP $type $coords2
  lassign $args font bgback
  if {$bgback ne {}} {set args [list $font {} 1]}
  my BuildPuzzlePieces $NP $type $X $Y $shift $zoom {*}$args
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

method TwoCircles {NP} {
  # Gets data of two glued circles.
  #   NP - current puzzle

  lassign $Circles($NP) X1 Y1 R1 X2 Y2 R2 pieces crcpieces
  lassign $crcpieces circle1 circle2
  set circle1 [split $circle1 ,]
  set circle2 [split $circle2 ,]
  list $X1 $Y1 $R1 $X2 $Y2 $R2 $pieces $circle1 $circle2
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

### ________________________ Puzzle pieces _________________________ ###

method BuildPuzzlePieces {NP type X Y shift zoom args} {
  # Builds a puzzle box's pieces.
  #   NP - name of puzzle
  #   type - box type
  #   X - x coordinate of box
  #   Y - y coordinate of box
  #   shift - pair of X, Y coordinates to shift the puzzle box
  #   zoom - zoom factor (0.1, 0.5, 1.0) for the puzzle

  set font $FONTSMALL
  set dotxt yes
  set bgback {}
  set dobind no
  set D(coords) [list]
  if {[llength $args]} {lassign $args font bgback dobind}
  lassign [my TwoCircles $NP] X1 Y1 R1 X2 Y2 R2 pieces circle1 circle2
  foreach xy $pieces {
    incr ipce
    lassign [split $xy ,] x y _
    if {$ipce in $circle1 && $ipce in $circle2} {
      set outline $BGWAIT
    } elseif {$bgback ne {}} {
      set outline $bgback
    } elseif {$_ ne {}} {
      set outline $FGCIRCLE2
    } else {
      set outline $FGCIRCLE1
    }
    set x [expr {($X+$x*$PCERADIUS)*$zoom}]
    set y [expr {($Y+$y*$PCERADIUS)*$zoom}]
    set xy2 [my CircleCoords $x $y [expr {$PCERADIUS*$zoom-1}]]
    set id1 [$Wcan3 create oval $xy2 -fill $BGCANVAS -outline $outline \
      -width [expr {ceil(4*$zoom)}]]
    if {$type eq "menu"} {
      set D(ID,$NP$type,pce$ipce) $id1
    } else {
      set D(ID,$type,pce$ipce) $id1
      set id2 [$Wcan3 create text $x $y -text $ipce -fill $BGSUCCESS -font $font]
      if {[string is true -strict $dobind]} {
        lappend D(coords) [list $ipce $id1 $id2 $x $y $xy2 $circle1 $circle2]
        my BindPiece $id1 $ipce
        my BindPiece $id2 $ipce
      }
      set D(ID,$type,txt$ipce) $id2
    }
  }
}
#_______________________

method BindPiece {id ipce} {
  # Binds item to event.
  #   id - id of item
  #   ipce - index

  $Wcan3 bind $id <ButtonPress> "[self] OnButtonPress $ipce"
  $Wcan3 bind $id <ButtonRelease> "[self] OnButtonRelease"
  $Wcan3 bind $id <Motion> "[self] OnButtonMotion"
}
#_______________________

method ItemCenterXY {ID X Y} {
  # Gets X, Y of item center
  #   ID - id of item
  #   X - X coordinate of item
  #   Y - Y coordinate of item

  lassign [$Wcan3 bbox $ID] x1 y1 x2 y2
  set X [expr {$X-($x2-$x1)/2+1}]
  set Y [expr {$Y-($y2-$y1)/2+1}]
  list $X $Y
}

## ________________________ Managing _________________________ ##

method Start {{idk ""} {doshuffle yes}} {
  # Starts the puzzle.
  #   idk - id of menu puzzle or index of the puzzle
  #   doshuffle - if no, use the original shuffled pattern

  if {$idk ne {}} {my HighlightPuzzle $idk}
  foreach id [array names D -glob *] {
    if {[string match *goal* $id] || [string match *puzzle* $id]} {
      $Wcan3 delete $D($id)
    }
  }
  my BuildPuzzleBox $D(puzzle) goal $BGSUCCESS $BGSUCCESS "420 130" 0.6
  my BuildPuzzleBox $D(puzzle) puzzle $FGCIRCLE1 $FGCIRCLE2 "530 20" 1. \
    $FONTLARGE $BGWAIT
  my ShufflePieces $doshuffle
  set Level [string index $D(puzzle) end]
  set D(click) [set D(end) no]
  set D(dndXY) [set D(dndtime) {}]
  set D(givingWay) 0
  set D(Move) 0
  my ShowMove
}
#_______________________

method BlinkAtStart {{color ""}} {
  # Blinking circle outline to make the start markable.
  #   color - color of outline

  foreach crc {1 2} {
    set id $D(ID,$D(puzzle)puzzle,crc$crc)
    if {$color eq {}} {
      set outline [set FGCIRCLE$crc]
    } else {
      set outline $color
    }
    $Wcan3 itemconfigure $id -outline $BGCANVAS
    after 300 "$Wcan3 itemconfigure $id -outline $outline"
  }
}
#_______________________

method State {mode} {
  # Saves/restores the current state.
  #   mode - "rC" (check), "w" (save user's will), "r" (restore user's will), \
  #          "rW" (save all), "rR" (read all)

  set res yes
  set m0 [string index $mode 0]
  catch {set ch [open $Rcfile $m0]}
  switch $mode {
    w {
      foreach k $SavedState {
        puts $ch $k\t$D($k)
      }
      puts $ch Level\t$Level
      puts $ch Difficulty\t$Difficulty
      $Wcan2.butDown configure -state normal
      my Message "The puzzle saved"
    }
    r - rC {
      set res no
      catch {
        foreach rc [split [read $ch] \n] {
          lassign [split $rc \t] k val
          switch -glob -- $k {
            {} - S-* {}
            Level - Difficulty {set $k $val}
            puzzle {
              set res yes
              if {$mode eq {rC}} break
              set D($k) $val
              my Start $val
            }
            default {set D($k) $val}
          }
        }
      } e
      if {$res} {
        if {$mode ne {rC}} {my RestoreState}
      } else {
        # saved puzzle not found
        $Wcan2.butDown configure -state disabled
      }
    }
    rW {
      set fcont [list]
      catch {
        foreach rc [split [read $ch] \n] {
          if {$rc ne {} && ![string match S-* $rc]} {
            lappend fcont $rc  ;# state saved by user's will
          }
        }
        close $ch
      }
      foreach k $SavedState {  ;# current state
        lappend fcont S-$k\t$D($k)
      }
      lappend fcont S-Level\t$Level
      lappend fcont S-Difficulty\t$Difficulty
      set ch [open $Rcfile w]
      foreach rc $fcont {puts $ch $rc}
    }
    rR {
      set res no
      catch {
        foreach rc [split [read $ch] \n] {
          lassign [split $rc \t] k val
          lassign [split $k -] -> var
          switch -glob -- $k {
            S-Level - S-Difficulty {set $var $val}
            S-puzzle {
              set D($var) $val
              my Start $val
              set res yes
            }
            S-* {set D($var) $val}
          }
        }
      } e
      if {$res} {my RestoreState}
    }
  }
  expr ![catch {close $ch}] && $res
}
#_______________________

method RestoreState {} {
  # Restores saved state of puzzle after reading it from .rc file.

  set OldDifficulty $Difficulty
  my ShufflePieces no $D(idxpce)
  incr D(Move) -1
  my ShowMove
  my End
  after idle "[self] Message {The puzzle restored}"
}
#_______________________

method SaveState {} {
  # Runs saving the current state.

  after idle "[self] State rW"
}
#_______________________

method SOS {} {
  # Shows a solution: rolls D(SOS) back.

  my Message {}
  my HideArrows
  set timo 2000
  if {!$D(givingWay)} {
    set D(givingWay) 1
    set D(Move) 0
    set D(clockwise) 0
    my BlinkAtStart $BGMSG2
    set timo 3000
  }
  catch {after cancel $D(idSOS)}
  set D(idSOS) [after $timo "[self] HideArrows"]
  lassign [lindex $D(SOS) end-$D(Move)] sos D(clockwise)
  set D(clockwise) [expr {-$D(clockwise)}]
  my ShowArrows
  my ShowMove yes
  my ShufflePieces no $sos
  set D(idxpce) $sos
  my InitUndoRedo
  update
  my End
  if {$D(end)} {
    set D(givingWay) 0
    incr D(Move) -1
    my ShowMove
  }
}
#_______________________

method End {} {
  # Checks if the puzzle is solved.

  if {!$D(end)} {
    if {[my ColorPieces]} {
      my Message {G R E A T!  YOU DID IT!}
      set D(end) yes
    }
  }
  if {$D(end)} {
    foreach crc {1 2} {
      set id $D(ID,$D(puzzle)puzzle,crc$crc)
      $Wcan3 itemconfigure $id -outline $BGSUCCESS
    }
  }
}

### ________________________ Main functions _________________________ ###

method ShufflePieces {{doshuffle yes} {pattern ""}} {
  # Shuffles puzzle pieces.
  #   doshuffle - if no, use the original shuffled pattern
  #   pattern - the pattern to set

  set numpce [llength [lindex $Circles($D(puzzle)) 6]]
  if {!$doshuffle} {
    if {$pattern eq ""} {
      set D(idxpce) $D(orig,idxpce)
    } else {
      set D(idxpce) $pattern
    }
  } else {
    set D(wanted) [split [string range 123456789 0 $numpce-1] {}]
    set repeat 99
    while {[incr repeat -1]} {
      set D(idxpce) $D(wanted)
      set D(SOS) [list [list $D(wanted) 0]]
      lassign [my TwoCircles $D(puzzle)] X1 Y1 R1 X2 Y2 R2 pieces circle1 circle2
      for {set i 0} {$i<$Difficulty*2} {incr i} {
        set shl [expr {int(floor(rand()*$numpce/2))}]
        for {set si 0} {$si<=$shl} {incr si} {
          set pce [expr {int(floor(rand()*$numpce))}]
          if {int(floor(rand()*2))} {set nei 1} {set nei 2}
          if {int(floor(rand()*2))} {set dir 1} {set dir 0}
          set ipce [lindex $D(idxpce) $pce]
          set neib1 [my Neighbors $ipce $circle1]
          set neib2 [my Neighbors $ipce $circle2]
          set neib [set neib$nei]
          if {[llength $neib1]} {
            if {![llength $neib2]} {set neib $neib1}
          } else {
            set neib $neib2
          }
          set ip [lindex $neib $dir]
          set D(idxpce) [my SupposeMoving $ipce $ip $circle1 $circle2 $neib1 $neib2]
          if {$D(idxpce) eq $D(wanted)} {
            set i 99
            break
          }
          set sos [list $D(idxpce) $D(clockwise)]
          if {$sos != [lindex $D(SOS) end]} {
            lappend D(SOS) $sos
          }
        }
      }
      # rare, still possible: nothing shuffled
      if {$D(idxpce) ne $D(wanted) && \
      (![info exists D(orig,idxpce)] || $D(orig,idxpce) ne $D(idxpce))} {
        break
      }
    }
    set D(orig,idxpce) $D(idxpce)
    my InitUndoRedo
    my SaveState
  }
  # update texts (numbers) & coordinates of pattern
  for {set ipce 1} {$ipce<=$numpce} {incr ipce} {
    $Wcan3 itemconfigure $D(ID,puzzle,txt$ipce) -text [lindex $D(idxpce) $ipce-1]
    lassign [lindex $D(coords) $ipce-1] -> id1 id2 x y
    lassign [my ItemCenterXY $id2 $x $y] x y
    $Wcan3 moveto $id2 $x $y
  }
  if {$doshuffle eq {false}} {
    # if run with "Start" button, blink Puzzled
    my BlinkAtStart
    my InitUndoRedo
    my SaveState
  }
  my ColorPieces
}
#_______________________

method SupposeMoving {ipce ip circle1 circle2 neib1 neib2} {
  # Gets a list of pieces after supposed moving.
  #   ipce - index of piece
  #   ip - index of neighbor where to move
  #   circle1 - indices of left circle
  #   circle2 - indices of right circle
  #   neib1 - neighbors of piece in left circle
  #   neib2 - neighbors of piece in right circle

  set i1 [lindex $circle1 $ipce]
  set i2 [lindex $circle2 $ipce]
  set n1 [lsearch $neib1 $ip]
  set n2 [lsearch $neib2 $ip]
  set pcs $D(idxpce)
  set D(clockwise) 0
  if {[lindex $circle1 $i1]!=$ipce && $n1>-1 || \
  [lindex $circle2 $i2]!=$ipce && $n2>-1} {
    if {$n1==0} {
      # clockwise in left
      set circle [list [lindex $circle1 end] {*}[lrange $circle1 0 end-1]]
      set D(clockwise) 1
    } elseif {$n1==1} {
      # anti-clockwise in left
      set circle [list {*}[lrange $circle1 1 end] [lindex $circle1 0]]
      set D(clockwise) -1
    } elseif {$n2==0} {
      # clockwise in right
      set circle [list [lindex $circle2 end] {*}[lrange $circle2 0 end-1]]
      set circle1 $circle2
      set D(clockwise) 2
    } else {
      # anti-clockwise in right
      set circle [list {*}[lrange $circle2 1 end] [lindex $circle2 0]]
      set circle1 $circle2
      set D(clockwise) -2
    }
    foreach i1 $circle1 i2 $circle {
      set a [lindex $D(idxpce) $i1-1]
      set pcs [list {*}[lrange $pcs 0 $i2-2] $a {*}[lrange $pcs $i2 end]]
    }
  }
  set D(idxpce-new) $pcs
}
#_______________________

method Neighbors {ipce circle} {
  # Gets neighbors of item in circle.
  #   ipce - number of item
  #   circle - numbers of circle

  if {[set i [lsearch $circle $ipce]]<0} {
    set res [list]
  } elseif {$i==0} {
    set res [list [lindex $circle end] [lindex $circle $i+1]]
  } elseif {$i==([llength $circle]-1)} {
    set res [list [lindex $circle $i-1] [lindex $circle 0]]
  } else {
    set res [list [lindex $circle $i-1] [lindex $circle $i+1]]
  }
  return $res
}
#_______________________

method ColorPieces {} {
  # Colorizes the puzzled pieces.
  # Returns yes, if all pieces are solved (green).

  set numpce [llength [lindex $Circles($D(puzzle)) 6]]
  set res yes
  for {set ipce 1} {$ipce<=$numpce} {incr ipce} {
    if {[lindex $D(idxpce) $ipce-1] == $ipce} {
      set outline $BGSUCCESS
    } else {
      set res no
      set outline [$Wcan3 itemcget $D(ID,puzzle,pce$ipce) -outline]
    }
    $Wcan3 itemconfigure $D(ID,puzzle,txt$ipce) -fill $outline
    $Wcan3 raise $D(ID,puzzle,txt$ipce)
  }
  return $res
}
#_______________________

method HighlightPuzzle {idk} {
  # Highlights a puzzle in menu.
  #   id - id of menu puzzle or index of the puzzle

  set NP P[string index $idk [string first menu $idk]-1]
  if {$NP eq {P}} {set NP $idk}
  if {[info exists D(prevpuzzle)]} {
    my ColorMenuPuzzle $D(prevpuzzle) $BGCANVAS
  }
  my ColorMenuPuzzle $NP $BGPENDING2
  set D(puzzle) [set D(prevpuzzle) $NP]
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

### ________________________ On events actions _________________________ ###

method OnButtonPress {ipce} {
  # Handles the mouse clicking a piece.
  #   ipce - index of piece

  set D(givingWay) [set D(clockwisesaved) 0]
  if {$D(end)} {
    my Message {This puzzle has been solved! You might start a new.}
  } else {
    set D(dndXY) [list [winfo pointerx $Win] [winfo pointery $Win] $ipce]
    set D(dndtime) [clock milliseconds]
    set D(idxpce-new) $D(idxpce)
  }
}
#_______________________

method OnButtonMotion {} {
  # Handles the mouse moving over a piece.

  if {$D(dndXY) eq {} || $D(dndtime) eq {} || $D(end)} return
  set dndtime [clock milliseconds]
  if {($dndtime-$D(dndtime))<30} {
    after idle "[self] OnButtonMotion" ;# to be in time with cursor
    return
  }
  set D(dndtime) $dndtime
  lassign $D(dndXY) x y ipce
  set x0 [winfo pointerx $Win]
  set y0 [winfo pointery $Win]
  set movX [expr {$x0 - $x}]
  set movY [expr {$y0 - $y}]
  set id $D(ID,puzzle,txt$ipce)
  $Wcan3 move $id $movX $movY
  $Wcan3 itemconfigure $id -fill red
  $Wcan3 raise $id
  set D(clockwise) 0
  foreach idov [$Wcan3 find overlapping {*}[$Wcan3 bbox $id]] {
    foreach dcoo $D(coords) {
      lassign $dcoo ip id1 id2 x y xy2 circle1 circle2
      set neib1 [my Neighbors $ipce $circle1]
      set neib2 [my Neighbors $ipce $circle2]
      if {($ip in $neib1 || $ip in $neib2) && ($id1==$idov || $id2==$idov)} {
        set num [$Wcan3 itemcget $id2 -text]
        my SupposeMoving $ipce $ip $circle1 $circle2 $neib1 $neib2
        break
      }
    }
    if {$D(clockwise)} break
  }
  if {$D(clockwisesaved)!=$D(clockwise)} {
    my HideArrows
  }
  my ShowArrows
  set D(clockwisesaved) $D(clockwise)
  set D(dndXY) [list $x0 $y0 $ipce]
  if {(abs($movX)+abs($movY))>10} {  ;# this stops when cursor stops
    my OnButtonMotion
  }
}
#_______________________

method OnButtonRelease {} {
  # Handles the mouse releasing a piece.

  my HideArrows
  if {$D(dndXY) eq {} || $D(dndtime) eq {} || $D(end)} return
  lassign $D(dndXY) x y id
  set D(dndXY) [set D(dndtime) {}]
  # place all pieces to their regular coordinates
  if {[info exist D(idxpce-new)]} {
    if {$D(clockwise)} {
      my ShufflePieces no $D(idxpce-new)
      my AddUndoRedo
      my ShowMove
    } else {
      my ShufflePieces no $D(idxpce) ;# rolled back
    }
    my End
  }
  my SaveState
}
#_______________________

method CheckDifficulty {d S} {
  # At changing the puzzle difficulty.
  #  d - action (%d of validate)
  #  S - pressed char (%S of validate)

  if {$d!=1 || $S<1 || $S>9 || ![string is digit $S]} {
    if {$d==1} {
      bell
      after idle "[self] difficulty $OldDifficulty"
    }
    return 1
  }
  set OldDifficulty $S
  after idle "[self] difficulty $OldDifficulty; [self] Start"
  return 1
}

### ________________________ Undo / Redo _________________________ ###

method InitUndoRedo {} {
  # Initializes undo/redo history.

  set D(History) [list [list $D(idxpce) 0]]
}
#_______________________

method AddUndoRedo {} {
  # Adds item to undo/redo history.

  set D(History) [list {*}[lrange $D(History) 0 $D(Move)] \
    [list $D(idxpce) $D(clockwise)]]
}
#_______________________

method CheckUndoRedo {} {
  # Checks availability of undo/redo.

  if {[lindex $D(History) $D(Move)-2] ne {}} {
    $Wcan2.butUndo configure -state normal
  } else {
    $Wcan2.butUndo configure -state disabled
  }
  if {[lindex $D(History) $D(Move)] ne {}} {
    $Wcan2.butRedo configure -state normal
  } else {
    $Wcan2.butRedo configure -state disabled
  }
}
#_______________________

method UndoRedo {dmove} {
  # Shifts and displays undo/redo history.
  #   dmove - shift in history

  incr D(Move) $dmove
  lassign [lindex $D(History) $D(Move)] D(idxpce) D(clockwise)
  if {$dmove<0} {
    lassign [lindex $D(History) $D(Move)+1] -> D(clockwise)
    set D(clockwise) [expr {-$D(clockwise)}]
  }
  my ShowArrows
  after 500 " \
    [self] HideArrows; \
    [self] ShufflePieces no {$D(idxpce)}; \
    [self] ShowMove; \
    [self] SaveState; \
    [self] End"
}

### ________________________ Arrows _________________________ ###

method ShowArrow {i j} {
  # Create arrow from i-th to j-th piece.
  #   i - index of i-th piece
  #   j - index of j-th piece

  if {[info exists D(arrow,1,$i)]} return
  lassign [lindex $D(coords) $i] - - -> x1 y1
  lassign [lindex $D(coords) $j] - - -> x2 y2
  set d [expr {sqrt(($x1-$x2)**2 + ($y1-$y2)**2)}]
  set k 0.24
  set X1 [expr {$x1 + $k*($x2 - $x1)}]
  set Y1 [expr {$y1 + $k*($y2 - $y1)}]
  set X2 [expr {$x2 - $k*($x2 - $x1)}]
  set Y2 [expr {$y2 - $k*($y2 - $y1)}]
  set k 0.61
  set z [expr {$k*$d}]
  set z2 [expr {$z/8}]
  set X [expr {$x1 + $k*($x2 - $x1)}]
  set Y [expr {$y1 + $k*($y2 - $y1)}]
  set cosA [expr {($x2 - $x1)/$d}]
  set sinA [expr {($y2 - $y1)/$d}]
  set XA [expr {$X - $z2*$sinA}]
  set YA [expr {$Y + $z2*$cosA}]
  set XB [expr {$X + $z2*$sinA}]
  set YB [expr {$Y - $z2*$cosA}]
  set D(arrow,1,$i) [$Wcan3 create polygon $X1 $Y1 $X2 $Y2 \
    -outline $BGPENDING2 -fill $BGPENDING2 -width 5]
  set D(arrow,2,$i) [$Wcan3 create polygon $X2 $Y2 $XB $YB $XA $YA \
    -outline $BGPENDING2 -fill $BGPENDING2 -width 3]
}
#_______________________

method ShowArrows {} {
  # Show arrows on 1 or 2 circle, clockwise and counter.

  lassign [lindex $D(coords) 0] - - - - - - circle1 circle2
  switch $D(clockwise) {
     1 {set arrlist [lreverse $circle1]}
    -1 {set arrlist $circle1}
     2 {set arrlist [lreverse $circle2]}
    -2 {set arrlist $circle2}
    default {my HideArrows; set arrlist [list]}
  }
  for {set i 0} {$i<[set llen [llength $arrlist]]} {incr i} {
    set j [expr {$i==($llen-1) ? 0 : [expr {$i+1}]}]
    set ii [expr {[lindex $arrlist $i]-1}]
    set jj [expr {[lindex $arrlist $j]-1}]
    my ShowArrow $ii $jj
  }
}
#_______________________

method HideArrows {} {
  # Remove arrows.

  foreach ak [array names D -glob arrow,*] {
    $Wcan3 delete $D($ak)
    unset D($ak)
  }
}

## ________________________ Messages _________________________ ##

method Message {msg {wait 30} {doit no}} {
  # Shows a message.
  #   msg - message's text
  #   wait - time to wait in 0.2 sec.
  #   doit - internally used by itself

  if {[$Wcan3 itemcget $D(PuzzledID) -fill] eq $BGMSG} return
  catch {  ;# the method can be called after destroying Puzzle object => catch
    set D(msg) {}
    catch {$Wcan4 delete $D(idmsg)}
    catch {after cancel $D(idafter)}
    if {!$doit} {
      after idle [list [self] Message [subst $msg] $wait yes]
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

method ShowMove {{alert 0}} {
  # Shows a current move.
  #   alert - if yes, sets alerting color of message.

  if {$alert} {set color $BGMSG} {set color $FGCIRCLE2}
  set movemax [expr {[llength $D(SOS)] - 1}]
  $Wcan3 itemconfigure $D(PuzzledID) -fill $color \
    -text "$D(PuzzledLabel): moves $D(Move) / $movemax"
  incr D(Move)
  my CheckUndoRedo
}
#_______________________

method ShowHelp {} {
  # Shows rules etc.

  tk_messageBox -title $TITLE -parent $Win -message \
{The task of the puzzle is
to rotate "Puzzled" pieces so
that they compose "Wanted"
pattern, as for numbers.

The pieces are included in
two glued cycles: left and
right. Both are rotated
clockwise or counter.

To rotate a cycle, click and
drag its piece and drop it
on one of its neighbors.

Clicking a puzzle pattern or
entering "Difficulty" value
starts a new puzzle.

Clicking the button "Restart"
restarts the current puzzle.
        ____________________

https://github.com/aplsimple}
}

  # ________________________ EOC _________________________ #

}

# ________________________ Run the puzzle _________________________ #

if {[info exist ::argv] && [info exist ::argv0] && \
[file normalize $::argv0] eq [file normalize [info script]]} {
  # run as stand-alone app
  wm withdraw .
  gluedcycles::run . [lindex $::argv 0] yes
}

# ________________________ EOF _________________________ #
