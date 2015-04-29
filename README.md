Krizalys Gentoo Overlay
=======================

Krizalys Gentoo Overlay is a Portage overlay to complement the Gentoo Linux
operating system.

Getting started
---------------

This overlay may be added to your system using [Layman][1]. Run the following
command (as root):

```
# layman -o https://raw.github.com/krizalys/gentoo-overlay/master/repositories.xml -f -a krizalys-gentoo
```

Packages from this overlay will then become available through [Portage][2]:

```
# emerge -av1 bochs
```

> These are the packages that would be merged, in order:
>
> Calculating dependencies... done!
>
> [ebuild  N     ] app-emulation/bochs-2.6.7::krizalys-gentoo  USE="X ncurses readline smp x86-64 -3dnow -avx -debugger -doc -gdb -sdl (-svga) -vnc -wxwidgets" 4,928 KiB
>
> Total: 1 package (1 new), Size of downloads: 4,928 KiB
>
> Would you like to merge these packages? [Yes/No]

Contents
--------

This overlay currently provides ebuilds for the following packages:

* [Bochs][3]
* [Composer][4]
* [wxHexEditor][5]

Credits
-------

The Sublime Portage package is developed and maintained by Christophe Vidal.

[1]: https://wiki.gentoo.org/wiki/Layman
[2]: https://wiki.gentoo.org/wiki/Portage
[3]: http://bochs.sourceforge.net/
[4]: https://getcomposer.org/
[5]: http://www.wxhexeditor.org/
