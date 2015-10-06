Krizalys Gentoo Overlay
=======================

Krizalys Gentoo Overlay is a Portage overlay to complement the Gentoo Linux
operating system.

Getting started
---------------

This overlay may be added to your system using [Layman][layman]. Run the
following command (as root):

```
# layman -o https://raw.github.com/krizalys/gentoo-overlay/master/repositories.xml -f -a krizalys-gentoo
```

Packages from this overlay will then become available through
[Portage][portage]:

```
# emerge -av1 bochs
```

> ```
> These are the packages that would be merged, in order:
>
> Calculating dependencies... done!
>
> [ebuild  N     ] app-emulation/bochs-2.6.7::krizalys-gentoo  USE="X ncurses readline smp x86-64 -3dnow -avx -debugger -doc -gdb -sdl (-svga) -vnc -wxwidgets" 4,928 KiB
>
> Total: 1 package (1 new), Size of downloads: 4,928 KiB
>
> Would you like to merge these packages? [Yes/No]
> ```

Contents
--------

This overlay currently provides ebuilds for the following packages:

* [Bochs][bochs]
* [Composer][composer]
* [OpenTTD][openttd]
* [Vagrant][vagrant]
* [VCMI][vcmi]
* [wxHexEditor][wxhexeditor]

Credits
-------

The Sublime Portage package is developed and maintained by Christophe Vidal.

[layman]:      https://wiki.gentoo.org/wiki/Layman
[portage]:     https://wiki.gentoo.org/wiki/Portage
[bochs]:       http://bochs.sourceforge.net/
[composer]:    https://getcomposer.org/
[openttd]:     https://www.openttd.org/
[vagrant]:     https://www.vagrantup.com/
[vcmi]:        http://vcmi.eu/
[wxhexeditor]: http://www.wxhexeditor.org/
