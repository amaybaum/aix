#
# Copyright 2014-2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module Opscode
  module Aix
    module Helpers
      def url_for(pkg, base_url = 'ftp://ftp.software.ibm.com/aix/freeSoftware/aixtoolbox/RPMS/ppc')
        pkgmap = {
          'a2ps' => { version: '4.13-2', rpm: 'a2ps/a2ps-4.13-2.aix4.3.ppc.rpm' },
          'aalib-devel' => { version: '1.2-1', rpm: 'aalib/aalib-devel-1.2-1.aix4.3.ppc.rpm' },
          'aalib' => { version: '1.2-1', rpm: 'aalib/aalib-1.2-1.aix4.3.ppc.rpm' },
          'acme' => { version: '2.4.0-1', rpm: 'acme/acme-2.4.0-1.aix5.1.ppc.rpm' },
          'arts' => { version: '1.0.0-1', rpm: 'arts/arts-1.0.0-1.aix4.3.ppc.rpm' },
          'aspell-devel' => { version: '0.33.6.3-4', rpm: 'aspell/aspell-devel-0.33.6.3-4.aix4.3.ppc.rpm' },
          'aspell' => { version: '0.33.6.3-5', rpm: 'aspell/aspell-0.33.6.3-5.aix4.3.ppc.rpm' },
          'at-spi-devel' => { version: '1.3.7-2', rpm: 'at-spi/at-spi-devel-1.3.7-2.aix5.1.ppc.rpm' },
          'at-spi' => { version: '1.3.7-2', rpm: 'at-spi/at-spi-1.3.7-2.aix5.1.ppc.rpm' },
          'atk-devel' => { version: '1.12.3-2', rpm: 'atk/atk-devel-1.12.3-2.aix5.2.ppc.rpm' },
          'atk' => { version: '1.12.3-2', rpm: 'atk/atk-1.12.3-2.aix5.2.ppc.rpm' },
          'audiofile-devel' => { version: '0.2.5-1', rpm: 'audiofile/audiofile-devel-0.2.5-1.aix5.1.ppc.rpm' },
          'audiofile' => { version: '0.2.5-1', rpm: 'audiofile/audiofile-0.2.5-1.aix5.1.ppc.rpm' },
          'autoconf213' => { version: '2.13-1', rpm: 'autoconf213/autoconf213-2.13-1.aix5.1.noarch.rpm' },
          'autoconf' => { version: '2.63-1', rpm: 'autoconf/autoconf-2.63-1.aix6.1.noarch.rpm' },
          'automake' => { version: '1.11-1', rpm: 'automake/automake-1.11-1.aix6.1.noarch.rpm' },
          'bash-doc' => { version: '4.2-3', rpm: 'bash/bash-doc-4.2-3.aix6.1.ppc.rpm' },
          'bash' => { version: '4.2-3', rpm: 'bash/bash-4.2-3.aix6.1.ppc.rpm' },
          'bc' => { version: '1.06-2', rpm: 'bc/bc-1.06-2.aix6.1.ppc.rpm' },
          'binutils' => { version: '2.14-4', rpm: 'binutils/binutils-2.14-4.aix6.1.ppc.rpm' },
          'bison' => { version: '1.875-3', rpm: 'bison/bison-1.875-3.aix5.1.ppc.rpm' },
          'bug-buddy' => { version: '2.4.0-2', rpm: 'bug-buddy/bug-buddy-2.4.0-2.aix5.1.ppc.rpm' },
          'bzip2' => { version: '1.0.5-3', rpm: 'bzip2/bzip2-1.0.5-3.aix5.3.ppc.rpm' },
          'cairo-devel' => { version: '1.10.0-1', rpm: 'cairo/cairo-devel-1.10.0-1.aix5.2.ppc.rpm' },
          'cairo' => { version: '1.10.0-1', rpm: 'cairo/cairo-1.10.0-1.aix5.2.ppc.rpm' },
          'cdda2wav' => { version: '1.9-4', rpm: 'cdrecord/cdda2wav-1.9-4.aix4.3.ppc.rpm' },
          'cdrecord-devel' => { version: '1.9-9', rpm: 'cdrecord/cdrecord-devel-1.9-9.aix5.3.ppc.rpm' },
          'cdrecord' => { version: '1.9-9', rpm: 'cdrecord/cdrecord-1.9-9.aix5.3.ppc.rpm' },
          'control-center' => { version: '2.4.0-1', rpm: 'control-center/control-center-2.4.0-1.aix5.1.ppc.rpm' },
          'coreutils' => { version: '5.2.1-2', rpm: 'coreutils/coreutils-5.2.1-2.aix5.1.ppc.rpm' },
          'cpio' => { version: '2.11-1', rpm: 'cpio/cpio-2.11-1.aix6.1.ppc.rpm' },
          'curl-devel' => { version: '7.9.3-2', rpm: 'curl/curl-devel-7.9.3-2.aix4.3.ppc.rpm' },
          'curl' => { version: '7.9.3-2', rpm: 'curl/curl-7.9.3-2.aix4.3.ppc.rpm' },
          'cvs' => { version: '1.11.17-3', rpm: 'cvs/cvs-1.11.17-3.aix5.1.ppc.rpm' },
          'db' => { version: '3.3.11-4', rpm: 'db/db-3.3.11-4.aix5.1.ppc.rpm' },
          'ddd' => { version: '3.3.1-2', rpm: 'ddd/ddd-3.3.1-2.aix4.3.ppc.rpm' },
          'dejagnu' => { version: '1.4.2-1', rpm: 'dejagnu/dejagnu-1.4.2-1.aix4.3.ppc.rpm' },
          'diffutils' => { version: '2.8.1-1', rpm: 'diffutils/diffutils-2.8.1-1.aix4.3.ppc.rpm' },
          'docbookx' => { version: '4.1.2-2', rpm: 'docbookx/docbookx-4.1.2-2.aix5.1.noarch.rpm' },
          'eel2-devel' => { version: '2.4.0-1', rpm: 'eel2/eel2-devel-2.4.0-1.aix5.1.ppc.rpm' },
          'eel2' => { version: '2.4.0-1', rpm: 'eel2/eel2-2.4.0-1.aix5.1.ppc.rpm' },
          'ElectricFence' => { version: '2.2.2-1', rpm: 'ElectricFence/ElectricFence-2.2.2-1.aix4.3.ppc.rpm' },
          'elm' => { version: '2.5.6-2', rpm: 'elm/elm-2.5.6-2.aix4.3.ppc.rpm' },
          'emacs-el' => { version: '21.3-1', rpm: 'emacs/emacs-el-21.3-1.aix5.1.ppc.rpm' },
          'emacs-leim' => { version: '21.3-1', rpm: 'emacs/emacs-leim-21.3-1.aix5.1.ppc.rpm' },
          'emacs-nox' => { version: '21.3-1', rpm: 'emacs/emacs-nox-21.3-1.aix5.1.ppc.rpm' },
          'emacs-X11' => { version: '21.3-1', rpm: 'emacs/emacs-X11-21.3-1.aix5.1.ppc.rpm' },
          'emacs' => { version: '21.3-1', rpm: 'emacs/emacs-21.3-1.aix5.1.ppc.rpm' },
          'enscript' => { version: '1.6.1-3', rpm: 'enscript/enscript-1.6.1-3.aix4.3.ppc.rpm' },
          'eog' => { version: '2.4.0-1', rpm: 'eog/eog-2.4.0-1.aix5.1.ppc.rpm' },
          'esound-devel' => { version: '0.2.34-1', rpm: 'esound/esound-devel-0.2.34-1.aix5.1.ppc.rpm' },
          'esound' => { version: '0.2.34-1', rpm: 'esound/esound-0.2.34-1.aix5.1.ppc.rpm' },
          'ethereal' => { version: '0.8.18-1', rpm: 'ethereal/ethereal-0.8.18-1.aix4.3.ppc.rpm' },
          'expat-devel' => { version: '2.0.1-2', rpm: 'expat/expat-devel-2.0.1-2.aix5.3.ppc.rpm' },
          'expat' => { version: '2.0.1-2', rpm: 'expat/expat-2.0.1-2.aix5.3.ppc.rpm' },
          'fetchmail' => { version: '5.9.10-1', rpm: 'fetchmail/fetchmail-5.9.10-1.aix4.3.ppc.rpm' },
          'fetchmailconf' => { version: '5.9.10-1', rpm: 'fetchmail/fetchmailconf-5.9.10-1.aix4.3.ppc.rpm' },
          'findutils' => { version: '4.1-3', rpm: 'findutils/findutils-4.1-3.aix4.3.ppc.rpm' },
          'flex' => { version: '2.5.4a-6', rpm: 'flex/flex-2.5.4a-6.aix4.3.ppc.rpm' },
          'fnlib-devel' => { version: '0.5-4', rpm: 'fnlib/fnlib-devel-0.5-4.aix4.3.ppc.rpm' },
          'fnlib' => { version: '0.5-4', rpm: 'fnlib/fnlib-0.5-4.aix4.3.ppc.rpm' },
          'fontconfig-devel' => { version: '2.4.2-1', rpm: 'fontconfig/fontconfig-devel-2.4.2-1.aix5.2.ppc.rpm' },
          'fontconfig' => { version: '2.4.2-1', rpm: 'fontconfig/fontconfig-2.4.2-1.aix5.2.ppc.rpm' },
          'freetype-demo' => { version: '1.3.1-9', rpm: 'freetype/freetype-demo-1.3.1-9.aix5.1.ppc.rpm' },
          'freetype-devel' => { version: '1.3.1-9', rpm: 'freetype/freetype-devel-1.3.1-9.aix5.1.ppc.rpm' },
          'freetype2-devel' => { version: '2.3.9-1', rpm: 'freetype2/freetype2-devel-2.3.9-1.aix5.2.ppc.rpm' },
          'freetype2' => { version: '2.3.9-1', rpm: 'freetype2/freetype2-2.3.9-1.aix5.2.ppc.rpm' },
          'freetype' => { version: '1.3.1-9', rpm: 'freetype/freetype-1.3.1-9.aix5.1.ppc.rpm' },
          'ftpcopy' => { version: '0.3.9-1', rpm: 'ftpcopy/ftpcopy-0.3.9-1.aix4.3.ppc.rpm' },
          'gail-devel' => { version: '1.4.0-1', rpm: 'gail/gail-devel-1.4.0-1.aix5.1.ppc.rpm' },
          'gail' => { version: '1.4.0-1', rpm: 'gail/gail-1.4.0-1.aix5.1.ppc.rpm' },
          'gawk' => { version: '3.1.3-1', rpm: 'gawk/gawk-3.1.3-1.aix5.1.ppc.rpm' },
          'gcc-c++' => { version: '4.2.0-3', rpm: 'gcc/gcc-cplusplus-4.2.0-3.aix6.1.ppc.rpm' },
          'gcc-gij' => { version: '4.2.0-3', rpm: 'gcc/gcc-gij-4.2.0-3.aix6.1.ppc.rpm' },
          'gcc-java' => { version: '4.2.0-3', rpm: 'gcc/gcc-java-4.2.0-3.aix6.1.ppc.rpm' },
          'gcc-locale' => { version: '4.2.0-3', rpm: 'gcc/gcc-locale-4.2.0-3.aix6.1.ppc.rpm' },
          'gcc' => { version: '4.2.0-3', rpm: 'gcc/gcc-4.2.0-3.aix6.1.ppc.rpm' },
          'gconf-editor' => { version: '2.4.0-1', rpm: 'gconf-editor/gconf-editor-2.4.0-1.aix5.1.ppc.rpm' },
          'GConf2-devel' => { version: '2.4.0.1-1', rpm: 'GConf2/GConf2-devel-2.4.0.1-1.aix5.1.ppc.rpm' },
          'GConf2' => { version: '2.4.0.1-1', rpm: 'GConf2/GConf2-2.4.0.1-1.aix5.1.ppc.rpm' },
          'gd-devel' => { version: '1.8.4-3', rpm: 'gd/gd-devel-1.8.4-3.aix5.1.ppc.rpm' },
          'gd-progs' => { version: '1.8.4-3', rpm: 'gd/gd-progs-1.8.4-3.aix5.1.ppc.rpm' },
          'gd' => { version: '1.8.4-3', rpm: 'gd/gd-1.8.4-3.aix5.1.ppc.rpm' },
          'gdb' => { version: '7.5-6', rpm: 'gdb/gdb-7.5-6.aix6.1.ppc.rpm' },
          'gdbm-devel' => { version: '1.8.3-5', rpm: 'gdbm/gdbm-devel-1.8.3-5.aix5.2.ppc.rpm' },
          'gdbm' => { version: '1.8.3-5', rpm: 'gdbm/gdbm-1.8.3-5.aix5.2.ppc.rpm' },
          'gdk-pixbuf-devel' => { version: '0.11.0-1', rpm: 'gdk-pixbuf/gdk-pixbuf-devel-0.11.0-1.aix4.3.ppc.rpm' },
          'gdk-pixbuf' => { version: '0.11.0-1', rpm: 'gdk-pixbuf/gdk-pixbuf-0.11.0-1.aix4.3.ppc.rpm' },
          'gdm' => { version: '2.4.4.0-2', rpm: 'gdm/gdm-2.4.4.0-2.aix5.1.ppc.rpm' },
          'gedit' => { version: '2.2.1-2', rpm: 'gedit/gedit-2.2.1-2.aix4.3.ppc.rpm' },
          'gettext' => { version: '0.10.40-8', rpm: 'gettext/gettext-0.10.40-8.aix5.2.ppc.rpm' },
          'ghostscript-fonts' => { version: '6.0-1', rpm: 'ghostscript-fonts/ghostscript-fonts-6.0-1.aix4.3.noarch.rpm' },
          'ghostscript' => { version: '5.50-5', rpm: 'ghostscript/ghostscript-5.50-5.aix5.2.ppc.rpm' },
          'gimp-devel' => { version: '1.2.2-1', rpm: 'gimp/gimp-devel-1.2.2-1.aix4.3.ppc.rpm' },
          'gimp-libgimp' => { version: '1.2.2-1', rpm: 'gimp/gimp-libgimp-1.2.2-1.aix4.3.ppc.rpm' },
          'gimp' => { version: '1.2.2-1', rpm: 'gimp/gimp-1.2.2-1.aix4.3.ppc.rpm' },
          'git' => { version: '4.3.20-4', rpm: 'git/git-4.3.20-4.aix6.1.ppc.rpm' },
          'glib-devel' => { version: '1.2.10-2', rpm: 'glib/glib-devel-1.2.10-2.aix4.3.ppc.rpm' },
          'glib2-devel' => { version: '2.14.6-2', rpm: 'glib2/glib2-devel-2.14.6-2.aix5.2.ppc.rpm' },
          'glib2' => { version: '2.14.6-2', rpm: 'glib2/glib2-2.14.6-2.aix5.2.ppc.rpm' },
          'glib' => { version: '1.2.10-2', rpm: 'glib/glib-1.2.10-2.aix4.3.ppc.rpm' },
          'gnome-applets' => { version: '2.4.0-3', rpm: 'gnome-applets/gnome-applets-2.4.0-3.aix5.1.ppc.rpm' },
          'gnome-audio-extra' => { version: '1.4.0-2', rpm: 'gnome-audio/gnome-audio-extra-1.4.0-2.aix5.1.ppc.rpm' },
          'gnome-audio' => { version: '1.4.0-2', rpm: 'gnome-audio/gnome-audio-1.4.0-2.aix5.1.ppc.rpm' },
          'gnome-common' => { version: '1.2.4-1', rpm: 'gnome-common/gnome-common-1.2.4-1.aix4.3.ppc.rpm' },
          'gnome-desktop-devel' => { version: '2.4.0-1', rpm: 'gnome-desktop/gnome-desktop-devel-2.4.0-1.aix5.1.ppc.rpm' },
          'gnome-desktop' => { version: '2.4.0-1', rpm: 'gnome-desktop/gnome-desktop-2.4.0-1.aix5.1.ppc.rpm' },
          'gnome-games' => { version: '2.4.0-3', rpm: 'gnome-games/gnome-games-2.4.0-3.aix5.1.ppc.rpm' },
          'gnome-icon-theme' => { version: '1.0.9-1', rpm: 'gnome-icon-theme/gnome-icon-theme-1.0.9-1.aix5.1.noarch.rpm' },
          'gnome-libs-devel' => { version: '1.4.1.2-1', rpm: 'gnome-libs/gnome-libs-devel-1.4.1.2-1.aix4.3.ppc.rpm' },
          'gnome-libs' => { version: '1.4.1.2-1', rpm: 'gnome-libs/gnome-libs-1.4.1.2-1.aix4.3.ppc.rpm' },
          'gnome-mag-devel' => { version: '0.10.3-1', rpm: 'gnome-mag/gnome-mag-devel-0.10.3-1.aix5.1.ppc.rpm' },
          'gnome-mag' => { version: '0.10.3-1', rpm: 'gnome-mag/gnome-mag-0.10.3-1.aix5.1.ppc.rpm' },
          'gnome-mime-data' => { version: '2.4.0-1', rpm: 'gnome-mime-data/gnome-mime-data-2.4.0-1.aix5.1.ppc.rpm' },
          'gnome-panel' => { version: '2.4.0-2', rpm: 'gnome-panel/gnome-panel-2.4.0-2.aix5.1.ppc.rpm' },
          'gnome-session' => { version: '2.4.0-1', rpm: 'gnome-session/gnome-session-2.4.0-1.aix5.1.ppc.rpm' },
          'gnome-speech-devel' => { version: '0.2.7-2', rpm: 'gnome-speech/gnome-speech-devel-0.2.7-2.aix5.1.ppc.rpm' },
          'gnome-speech' => { version: '0.2.7-2', rpm: 'gnome-speech/gnome-speech-0.2.7-2.aix5.1.ppc.rpm' },
          'gnome-system-monitor' => { version: '2.4.0-2', rpm: 'gnome-system-monitor/gnome-system-monitor-2.4.0-2.aix5.1.ppc.rpm' },
          'gnome-terminal' => { version: '2.4.0.1-1', rpm: 'gnome-terminal/gnome-terminal-2.4.0.1-1.aix5.1.ppc.rpm' },
          'gnome-themes' => { version: '2.4.0-1', rpm: 'gnome-themes/gnome-themes-2.4.0-1.aix5.1.ppc.rpm' },
          'gnome-utils' => { version: '2.4.0-1', rpm: 'gnome-utils/gnome-utils-2.4.0-1.aix5.1.ppc.rpm' },
          'gnome-vfs2-devel' => { version: '2.4.0-1', rpm: 'gnome-vfs2/gnome-vfs2-devel-2.4.0-1.aix5.1.ppc.rpm' },
          'gnome-vfs2' => { version: '2.4.0-1', rpm: 'gnome-vfs2/gnome-vfs2-2.4.0-1.aix5.1.ppc.rpm' },
          'gnome2-user-docs' => { version: '2.4.0-1', rpm: 'gnome2-user-docs/gnome2-user-docs-2.4.0-1.aix5.1.ppc.rpm' },
          'gnopernicus-devel' => { version: '0.7.0-1', rpm: 'gnopernicus/gnopernicus-devel-0.7.0-1.aix5.1.ppc.rpm' },
          'gnopernicus' => { version: '0.7.0-1', rpm: 'gnopernicus/gnopernicus-0.7.0-1.aix5.1.ppc.rpm' },
          'gok-devel' => { version: '0.8.4-1', rpm: 'gok/gok-devel-0.8.4-1.aix5.1.ppc.rpm' },
          'gok' => { version: '0.8.4-1', rpm: 'gok/gok-0.8.4-1.aix5.1.ppc.rpm' },
          'grep' => { version: '2.5.1-1', rpm: 'grep/grep-2.5.1-1.aix4.3.ppc.rpm' },
          'groff-gxditview' => { version: '1.17.2-1', rpm: 'groff/groff-gxditview-1.17.2-1.aix4.3.ppc.rpm' },
          'groff' => { version: '1.17.2-1', rpm: 'groff/groff-1.17.2-1.aix4.3.ppc.rpm' },
          'gtk+-devel' => { version: '1.2.10-4', rpm: 'gtkplus/gtkplus-devel-1.2.10-4.aix5.1.ppc.rpm' },
          'gtk+' => { version: '1.2.10-4', rpm: 'gtkplus/gtkplus-1.2.10-4.aix5.1.ppc.rpm' },
          'gtk-doc' => { version: '1.1-2', rpm: 'gtk-doc/gtk-doc-1.1-2.aix5.1.ppc.rpm' },
          'gtk-engines' => { version: '0.12-1', rpm: 'gtk-engines/gtk-engines-0.12-1.aix4.3.ppc.rpm' },
          'gtk2-devel' => { version: '2.10.6-5', rpm: 'gtk2/gtk2-devel-2.10.6-5.aix5.2.ppc.rpm' },
          'gtk2-engines' => { version: '2.2.0-2', rpm: 'gtk2-engines/gtk2-engines-2.2.0-2.aix5.1.ppc.rpm' },
          'gtk2' => { version: '2.10.6-5', rpm: 'gtk2/gtk2-2.10.6-5.aix5.2.ppc.rpm' },
          'gtkhtml2-devel' => { version: '2.4.0-2', rpm: 'gtkhtml2/gtkhtml2-devel-2.4.0-2.aix5.1.ppc.rpm' },
          'gtkhtml2' => { version: '2.4.0-2', rpm: 'gtkhtml2/gtkhtml2-2.4.0-2.aix5.1.ppc.rpm' },
          'guile-devel' => { version: '1.4-3', rpm: 'guile/guile-devel-1.4-3.aix4.3.ppc.rpm' },
          'guile' => { version: '1.4-3', rpm: 'guile/guile-1.4-3.aix4.3.ppc.rpm' },
          'gv' => { version: '3.5.8-4', rpm: 'gv/gv-3.5.8-4.aix4.3.ppc.rpm' },
          'gzip' => { version: '1.2.4a-10', rpm: 'gzip/gzip-1.2.4a-10.aix5.2.ppc.rpm' },
          'help2man' => { version: '1.29-1', rpm: 'help2man/help2man-1.29-1.aix4.3.noarch.rpm' },
          'hexedit' => { version: '1.2.2-1', rpm: 'hexedit/hexedit-1.2.2-1.aix4.3.ppc.rpm' },
          'imlib-devel' => { version: '1.9.11-1', rpm: 'imlib/imlib-devel-1.9.11-1.aix4.3.ppc.rpm' },
          'imlib' => { version: '1.9.11-1', rpm: 'imlib/imlib-1.9.11-1.aix4.3.ppc.rpm' },
          'indent' => { version: '2.2.7-2', rpm: 'indent/indent-2.2.7-2.aix4.3.ppc.rpm' },
          'info' => { version: '4.6-1', rpm: 'texinfo/info-4.6-1.aix5.1.ppc.rpm' },
          'intltool' => { version: '0.27.2-1', rpm: 'intltool/intltool-0.27.2-1.aix5.1.ppc.rpm' },
          'jade' => { version: '1.2.1-4', rpm: 'jade/jade-1.2.1-4.aix4.3.ppc.rpm' },
          'kdeaddons' => { version: '3.0-1', rpm: 'kdeaddons/kdeaddons-3.0-1.aix4.3.ppc.rpm' },
          'kdeadmin' => { version: '3.0-1', rpm: 'kdeadmin/kdeadmin-3.0-1.aix4.3.ppc.rpm' },
          'kdeartwork' => { version: '3.0-1', rpm: 'kdeartwork/kdeartwork-3.0-1.aix4.3.ppc.rpm' },
          'kdebase' => { version: '3.0-2', rpm: 'kdebase/kdebase-3.0-2.aix4.3.ppc.rpm' },
          'kdebindings' => { version: '3.0-1', rpm: 'kdebindings/kdebindings-3.0-1.aix4.3.ppc.rpm' },
          'kdeedu' => { version: '3.0-1', rpm: 'kdeedu/kdeedu-3.0-1.aix4.3.ppc.rpm' },
          'kdegames' => { version: '3.0-1', rpm: 'kdegames/kdegames-3.0-1.aix4.3.ppc.rpm' },
          'kdegraphics' => { version: '3.0-1', rpm: 'kdegraphics/kdegraphics-3.0-1.aix4.3.ppc.rpm' },
          'kdelibs-devel' => { version: '3.0-1', rpm: 'kdelibs/kdelibs-devel-3.0-1.aix4.3.ppc.rpm' },
          'kdelibs-sound-devel' => { version: '3.0-1', rpm: 'kdelibs/kdelibs-sound-devel-3.0-1.aix4.3.ppc.rpm' },
          'kdelibs-sound' => { version: '3.0-1', rpm: 'kdelibs/kdelibs-sound-3.0-1.aix4.3.ppc.rpm' },
          'kdelibs' => { version: '3.0-1', rpm: 'kdelibs/kdelibs-3.0-1.aix4.3.ppc.rpm' },
          'kdemultimedia' => { version: '3.0-1', rpm: 'kdemultimedia/kdemultimedia-3.0-1.aix4.3.ppc.rpm' },
          'kdenetwork' => { version: '3.0-2', rpm: 'kdenetwork/kdenetwork-3.0-2.aix4.3.ppc.rpm' },
          'kdepim' => { version: '3.0-1', rpm: 'kdepim/kdepim-3.0-1.aix4.3.ppc.rpm' },
          'kdesdk' => { version: '3.0-1', rpm: 'kdesdk/kdesdk-3.0-1.aix4.3.ppc.rpm' },
          'kdetoys' => { version: '3.0-1', rpm: 'kdetoys/kdetoys-3.0-1.aix4.3.ppc.rpm' },
          'kdeutils' => { version: '3.0-1', rpm: 'kdeutils/kdeutils-3.0-1.aix4.3.ppc.rpm' },
          'less' => { version: '382-1', rpm: 'less/less-382-1.aix5.1.ppc.rpm' },
          'libart_lgpl-devel' => { version: '2.3.17-4', rpm: 'libart_lgpl/libart_lgpl-devel-2.3.17-4.aix5.1.ppc.rpm' },
          'libart_lgpl' => { version: '2.3.17-4', rpm: 'libart_lgpl/libart_lgpl-2.3.17-4.aix5.1.ppc.rpm' },
          'libbonobo-devel' => { version: '2.4.0-1', rpm: 'libbonobo/libbonobo-devel-2.4.0-1.aix5.1.ppc.rpm' },
          'libbonobo' => { version: '2.4.0-1', rpm: 'libbonobo/libbonobo-2.4.0-1.aix5.1.ppc.rpm' },
          'libbonoboui-devel' => { version: '2.4.0-1', rpm: 'libbonoboui/libbonoboui-devel-2.4.0-1.aix5.1.ppc.rpm' },
          'libbonoboui' => { version: '2.4.0-1', rpm: 'libbonoboui/libbonoboui-2.4.0-1.aix5.1.ppc.rpm' },
          'libffi-devel' => { version: '4.2.0-3', rpm: 'gcc/libffi-devel-4.2.0-3.aix6.1.ppc.rpm' },
          'libffi' => { version: '4.2.0-3', rpm: 'gcc/libffi-4.2.0-3.aix6.1.ppc.rpm' },
          'libgail-gnome' => { version: '1.0.2-2', rpm: 'libgail-gnome/libgail-gnome-1.0.2-2.aix5.1.ppc.rpm' },
          'libgcc' => { version: '4.2.0-3', rpm: 'gcc/libgcc-4.2.0-3.aix6.1.ppc.rpm' },
          'libgcj-devel' => { version: '4.2.0-3', rpm: 'gcc/libgcj-devel-4.2.0-3.aix6.1.ppc.rpm' },
          'libgcj' => { version: '4.2.0-3', rpm: 'gcc/libgcj-4.2.0-3.aix6.1.ppc.rpm' },
          'libghttp-devel' => { version: '1.0.9-1', rpm: 'libghttp/libghttp-devel-1.0.9-1.aix4.3.ppc.rpm' },
          'libghttp' => { version: '1.0.9-1', rpm: 'libghttp/libghttp-1.0.9-1.aix4.3.ppc.rpm' },
          'libglade2-devel' => { version: '2.0.1-2', rpm: 'libglade2/libglade2-devel-2.0.1-2.aix5.1.ppc.rpm' },
          'libglade2' => { version: '2.0.1-2', rpm: 'libglade2/libglade2-2.0.1-2.aix5.1.ppc.rpm' },
          'libgnome-devel' => { version: '2.4.0-1', rpm: 'libgnome/libgnome-devel-2.4.0-1.aix5.1.ppc.rpm' },
          'libgnome' => { version: '2.4.0-1', rpm: 'libgnome/libgnome-2.4.0-1.aix5.1.ppc.rpm' },
          'libgnomecanvas-devel' => { version: '2.4.0-1', rpm: 'libgnomecanvas/libgnomecanvas-devel-2.4.0-1.aix5.1.ppc.rpm' },
          'libgnomecanvas' => { version: '2.4.0-1', rpm: 'libgnomecanvas/libgnomecanvas-2.4.0-1.aix5.1.ppc.rpm' },
          'libgnomeprint-devel' => { version: '2.3.1-1', rpm: 'libgnomeprint/libgnomeprint-devel-2.3.1-1.aix5.1.ppc.rpm' },
          'libgnomeprint' => { version: '2.3.1-1', rpm: 'libgnomeprint/libgnomeprint-2.3.1-1.aix5.1.ppc.rpm' },
          'libgnomeprintui-devel' => { version: '2.3.1-1', rpm: 'libgnomeprintui/libgnomeprintui-devel-2.3.1-1.aix5.1.ppc.rpm' },
          'libgnomeprintui' => { version: '2.3.1-1', rpm: 'libgnomeprintui/libgnomeprintui-2.3.1-1.aix5.1.ppc.rpm' },
          'libgnomeui-devel' => { version: '2.4.0.1-1', rpm: 'libgnomeui/libgnomeui-devel-2.4.0.1-1.aix5.1.ppc.rpm' },
          'libgnomeui' => { version: '2.4.0.1-1', rpm: 'libgnomeui/libgnomeui-2.4.0.1-1.aix5.1.ppc.rpm' },
          'libgomp' => { version: '4.2.0-3', rpm: 'gcc/libgomp-4.2.0-3.aix6.1.ppc.rpm' },
          'libgtop2-devel' => { version: '2.0.5-1', rpm: 'libgtop2/libgtop2-devel-2.0.5-1.aix5.1.ppc.rpm' },
          'libgtop2' => { version: '2.0.5-1', rpm: 'libgtop2/libgtop2-2.0.5-1.aix5.1.ppc.rpm' },
          'libIDL-devel' => { version: '0.8.6-3', rpm: 'libIDL/libIDL-devel-0.8.6-3.aix5.2.ppc.rpm' },
          'libIDL' => { version: '0.8.6-3', rpm: 'libIDL/libIDL-0.8.6-3.aix5.2.ppc.rpm' },
          'libjpeg-devel' => { version: '6b-6', rpm: 'libjpeg/libjpeg-devel-6b-6.aix5.1.ppc.rpm' },
          'libjpeg' => { version: '6b-6', rpm: 'libjpeg/libjpeg-6b-6.aix5.1.ppc.rpm' },
          'libmng-devel' => { version: '1.0.3-2', rpm: 'libmng/libmng-devel-1.0.3-2.aix4.3.ppc.rpm' },
          'libmng' => { version: '1.0.3-2', rpm: 'libmng/libmng-1.0.3-2.aix4.3.ppc.rpm' },
          'libpcap' => { version: '0.8.3-1', rpm: 'libpcap/libpcap-0.8.3-1.aix5.1.ppc.rpm' },
          'libpng-devel' => { version: '1.2.32-2', rpm: 'libpng/libpng-devel-1.2.32-2.aix5.2.ppc.rpm' },
          'libpng' => { version: '1.2.32-2', rpm: 'libpng/libpng-1.2.32-2.aix5.2.ppc.rpm' },
          'libPropList' => { version: '0.10.1-1', rpm: 'libPropList/libPropList-0.10.1-1.aix4.3.ppc.rpm' },
          'librep-devel' => { version: '0.14-1', rpm: 'librep/librep-devel-0.14-1.aix4.3.ppc.rpm' },
          'librep' => { version: '0.14-1', rpm: 'librep/librep-0.14-1.aix4.3.ppc.rpm' },
          'librsvg2-devel' => { version: '2.4.0-1', rpm: 'librsvg2/librsvg2-devel-2.4.0-1.aix5.1.ppc.rpm' },
          'librsvg2' => { version: '2.4.0-1', rpm: 'librsvg2/librsvg2-2.4.0-1.aix5.1.ppc.rpm' },
          'libstdc++-devel' => { version: '4.2.0-3', rpm: 'gcc/libstdcplusplus-devel-4.2.0-3.aix6.1.ppc.rpm' },
          'libstdc++' => { version: '4.2.0-3', rpm: 'gcc/libstdcplusplus-4.2.0-3.aix6.1.ppc.rpm' },
          'libtiff-devel' => { version: '3.8.2-1', rpm: 'libtiff/libtiff-devel-3.8.2-1.aix5.2.ppc.rpm' },
          'libtiff' => { version: '3.8.2-1', rpm: 'libtiff/libtiff-3.8.2-1.aix5.2.ppc.rpm' },
          'libtool' => { version: '1.5.8-2', rpm: 'libtool/libtool-1.5.8-2.aix5.1.ppc.rpm' },
          'libungif-devel' => { version: '4.1.2-1', rpm: 'libungif/libungif-devel-4.1.2-1.aix5.1.ppc.rpm' },
          'libungif-progs' => { version: '4.1.2-1', rpm: 'libungif/libungif-progs-4.1.2-1.aix5.1.ppc.rpm' },
          'libungif' => { version: '4.1.2-1', rpm: 'libungif/libungif-4.1.2-1.aix5.1.ppc.rpm' },
          'libwnck-devel' => { version: '2.4.0.1-1', rpm: 'libwnck/libwnck-devel-2.4.0.1-1.aix5.1.ppc.rpm' },
          'libwnck' => { version: '2.4.0.1-1', rpm: 'libwnck/libwnck-2.4.0.1-1.aix5.1.ppc.rpm' },
          'libxml2-devel' => { version: '2.6.21-4', rpm: 'libxml2/libxml2-devel-2.6.21-4.aix5.2.ppc.rpm' },
          'libxml2' => { version: '2.6.21-4', rpm: 'libxml2/libxml2-2.6.21-4.aix5.2.ppc.rpm' },
          'libxslt-devel' => { version: '1.1.5-2', rpm: 'libxslt/libxslt-devel-1.1.5-2.aix5.1.ppc.rpm' },
          'libxslt' => { version: '1.1.5-2', rpm: 'libxslt/libxslt-1.1.5-2.aix5.1.ppc.rpm' },
          'libzvt-devel' => { version: '2.0.1-1', rpm: 'libzvt/libzvt-devel-2.0.1-1.aix4.3.ppc.rpm' },
          'libzvt' => { version: '2.0.1-1', rpm: 'libzvt/libzvt-2.0.1-1.aix4.3.ppc.rpm' },
          'lynx' => { version: '2.8.4-2', rpm: 'lynx/lynx-2.8.4-2.aix5.1.ppc.rpm' },
          'm4' => { version: '1.4.13-1', rpm: 'm4/m4-1.4.13-1.aix6.1.ppc.rpm' },
          'make' => { version: '3.81-1', rpm: 'make/make-3.81-1.aix6.1.ppc.rpm' },
          'mawk' => { version: '1.3.3-8', rpm: 'mawk/mawk-1.3.3-8.aix4.3.ppc.rpm' },
          'metacity' => { version: '2.6.1-1', rpm: 'metacity/metacity-2.6.1-1.aix5.1.ppc.rpm' },
          'metamail' => { version: '2.7-2', rpm: 'metamail/metamail-2.7-2.aix4.3.ppc.rpm' },
          'mkisofs' => { version: '1.13-9', rpm: 'cdrecord/mkisofs-1.13-9.aix5.3.ppc.rpm' },
          'mpage' => { version: '2.5-2', rpm: 'mpage/mpage-2.5-2.aix4.3.ppc.rpm' },
          'mtools' => { version: '3.9.8-3', rpm: 'mtools/mtools-3.9.8-3.aix4.3.ppc.rpm' },
          'mutt' => { version: '1.4.2.1-1', rpm: 'mutt/mutt-1.4.2.1-1.aix5.1.ppc.rpm' },
          'MySQL-client' => { version: '3.23.58-2', rpm: 'MySQL/MySQL-client-3.23.58-2.aix5.1.ppc.rpm' },
          'MySQL-devel' => { version: '3.23.58-2', rpm: 'MySQL/MySQL-devel-3.23.58-2.aix5.1.ppc.rpm' },
          'MySQL' => { version: '3.23.58-2', rpm: 'MySQL/MySQL-3.23.58-2.aix5.1.ppc.rpm' },
          'nautilus' => { version: '2.4.0-1', rpm: 'nautilus/nautilus-2.4.0-1.aix5.1.ppc.rpm' },
          'ncftp' => { version: '3.1.1-3', rpm: 'ncftp/ncftp-3.1.1-3.aix4.3.ppc.rpm' },
          'ncurses-devel' => { version: '5.2-3', rpm: 'ncurses/ncurses-devel-5.2-3.aix4.3.ppc.rpm' },
          'ncurses' => { version: '5.2-3', rpm: 'ncurses/ncurses-5.2-3.aix4.3.ppc.rpm' },
          'openCIMOM' => { version: '0.8-1', rpm: 'openCIMOM/openCIMOM-0.8-1.aix5.2.noarch.rpm' },
          'openldap-devel' => { version: '2.0.21-4', rpm: 'openldap/openldap-devel-2.0.21-4.aix4.3.ppc.rpm' },
          'openldap' => { version: '2.0.21-4', rpm: 'openldap/openldap-2.0.21-4.aix4.3.ppc.rpm' },
          'ORBit-devel' => { version: '0.5.12-1', rpm: 'ORBit/ORBit-devel-0.5.12-1.aix4.3.ppc.rpm' },
          'ORBit2-devel' => { version: '2.8.1-1', rpm: 'ORBit2/ORBit2-devel-2.8.1-1.aix5.1.ppc.rpm' },
          'ORBit2' => { version: '2.8.1-1', rpm: 'ORBit2/ORBit2-2.8.1-1.aix5.1.ppc.rpm' },
          'ORBit' => { version: '0.5.12-1', rpm: 'ORBit/ORBit-0.5.12-1.aix4.3.ppc.rpm' },
          'pango-devel' => { version: '1.14.5-4', rpm: 'pango/pango-devel-1.14.5-4.aix5.2.ppc.rpm' },
          'pango' => { version: '1.14.5-4', rpm: 'pango/pango-1.14.5-4.aix5.2.ppc.rpm' },
          'patch' => { version: '2.5.4-4', rpm: 'patch/patch-2.5.4-4.aix4.3.ppc.rpm' },
          'pcre-devel' => { version: '3.7-3', rpm: 'pcre/pcre-devel-3.7-3.aix5.1.ppc.rpm' },
          'pcre' => { version: '3.7-3', rpm: 'pcre/pcre-3.7-3.aix5.1.ppc.rpm' },
          'pegasus' => { version: '1.0-9', rpm: 'pegasus/pegasus-1.0-9.aix5.1.ppc.rpm' },
          'perl' => { version: '5.8.2-1', rpm: 'perl/perl-5.8.2-1.aix5.1.ppc.rpm' },
          'php-devel' => { version: '4.0.6-6ssl', rpm: 'php/php-devel-4.0.6-6ssl.aix5.3.ppc.rpm' },
          'php-manual' => { version: '4.0.6-6ssl', rpm: 'php/php-manual-4.0.6-6ssl.aix5.3.ppc.rpm' },
          'php' => { version: '4.0.6-5', rpm: 'php/php-4.0.6-5.aix4.3.ppc.rpm' },
          'pine' => { version: '4.44-3', rpm: 'pine/pine-4.44-3.aix4.3.ppc.rpm' },
          'pixman-devel' => { version: '0.20.0-1', rpm: 'pixman/pixman-devel-0.20.0-1.aix5.2.ppc.rpm' },
          'pixman' => { version: '0.20.0-1', rpm: 'pixman/pixman-0.20.0-1.aix5.2.ppc.rpm' },
          'pkg-config' => { version: '0.19-6', rpm: 'pkg-config/pkg-config-0.19-6.aix5.2.ppc.rpm' },
          'popt' => { version: '1.7-2', rpm: 'rpm/popt-1.7-2.aix5.1.ppc.rpm' },
          'prngd' => { version: '0.9.29-1', rpm: 'prngd/prngd-0.9.29-1.aix5.1.ppc.rpm' },
          'procmail' => { version: '3.21-1', rpm: 'procmail/procmail-3.21-1.aix4.3.ppc.rpm' },
          'proftpd' => { version: '1.2.8-1', rpm: 'proftpd/proftpd-1.2.8-1.aix5.1.ppc.rpm' },
          'pspell-devel' => { version: '0.12.2-2', rpm: 'pspell/pspell-devel-0.12.2-2.aix4.3.ppc.rpm' },
          'pspell' => { version: '0.12.2-2', rpm: 'pspell/pspell-0.12.2-2.aix4.3.ppc.rpm' },
          'pth-devel' => { version: '1.4.0-2', rpm: 'pth/pth-devel-1.4.0-2.aix4.3.ppc.rpm' },
          'pth' => { version: '1.4.0-2', rpm: 'pth/pth-1.4.0-2.aix4.3.ppc.rpm' },
          'python-devel' => { version: '2.7.5-1', rpm: 'python/python-devel-2.7.5-1.aix6.1.ppc.rpm' },
          'python-docs' => { version: '2.7.5-1', rpm: 'python/python-docs-2.7.5-1.aix6.1.ppc.rpm' },
          'python-tools' => { version: '2.7.5-1', rpm: 'python/python-tools-2.7.5-1.aix6.1.ppc.rpm' },
          'python' => { version: '2.7.5-1', rpm: 'python/python-2.7.5-1.aix6.1.ppc.rpm' },
          'qt-designer' => { version: '3.0.3-1', rpm: 'qt/qt-designer-3.0.3-1.aix4.3.ppc.rpm' },
          'qt-devel' => { version: '3.0.3-1', rpm: 'qt/qt-devel-3.0.3-1.aix4.3.ppc.rpm' },
          'qt-Xt' => { version: '3.0.3-1', rpm: 'qt/qt-Xt-3.0.3-1.aix4.3.ppc.rpm' },
          'qt' => { version: '3.0.3-1', rpm: 'qt/qt-3.0.3-1.aix4.3.ppc.rpm' },
          'rcs' => { version: '5.7-2', rpm: 'rcs/rcs-5.7-2.aix5.1.ppc.rpm' },
          'rdist' => { version: '6.1.5-2', rpm: 'rdist/rdist-6.1.5-2.aix4.3.ppc.rpm' },
          'readline-devel' => { version: '6.1-1', rpm: 'readline/readline-devel-6.1-1.aix6.1.ppc.rpm' },
          'readline' => { version: '6.1-1', rpm: 'readline/readline-6.1-1.aix6.1.ppc.rpm' },
          'rpm-build' => { version: '3.0.5-52', rpm: 'rpm/rpm-build-3.0.5-52.aix5.3.ppc.rpm' },
          'rpm-devel' => { version: '3.0.5-52', rpm: 'rpm/rpm-devel-3.0.5-52.aix5.3.ppc.rpm' },
          'rpm' => { version: '3.0.5-52', rpm: 'rpm/rpm-3.0.5-52.aix5.3.ppc.rpm' },
          'rsync' => { version: '3.0.6-1', rpm: 'rsync/rsync-3.0.6-1.aix5.3.ppc.rpm' },
          'rxvt' => { version: '2.6.3-3', rpm: 'rxvt/rxvt-2.6.3-3.aix4.3.ppc.rpm' },
          'screen' => { version: '3.9.10-2', rpm: 'screen/screen-3.9.10-2.aix4.3.ppc.rpm' },
          'scrollkeeper' => { version: '0.3.12-1', rpm: 'scrollkeeper/scrollkeeper-0.3.12-1.aix5.1.ppc.rpm' },
          'sed' => { version: '4.1.1-1', rpm: 'sed/sed-4.1.1-1.aix5.1.ppc.rpm' },
          'sharutils' => { version: '4.2.1-1', rpm: 'sharutils/sharutils-4.2.1-1.aix4.3.ppc.rpm' },
          'slang-devel' => { version: '1.4.4-2', rpm: 'slang/slang-devel-1.4.4-2.aix4.3.ppc.rpm' },
          'slang' => { version: '1.4.4-2', rpm: 'slang/slang-1.4.4-2.aix4.3.ppc.rpm' },
          'smake' => { version: '1.3.2-1', rpm: 'smake/smake-1.3.2-1.aix4.3.noarch.rpm' },
          'splint' => { version: '3.0.1.6-2', rpm: 'splint/splint-3.0.1.6-2.aix5.1.ppc.rpm' },
          'squid' => { version: '2.4.STABLE7-2', rpm: 'squid/squid-2.4.STABLE7-2.aix4.3.ppc.rpm' },
          'startup-notification-devel' => { version: '0.5-2', rpm: 'startup-notification/startup-notification-devel-0.5-2.aix5.1.ppc.rpm' },
          'startup-notification' => { version: '0.5-2', rpm: 'startup-notification/startup-notification-0.5-2.aix5.1.ppc.rpm' },
          'sudo' => { version: '1.6.9p23-2noldap', rpm: 'sudo/sudo-1.6.9p23-2noldap.aix5.3.ppc.rpm' },
          'tar' => { version: '1.22-1', rpm: 'tar/tar-1.22-1.aix6.1.ppc.rpm' },
          'tcpdump' => { version: '3.8.1-1', rpm: 'tcpdump/tcpdump-3.8.1-1.aix5.1.ppc.rpm' },
          'tcsh' => { version: '6.11-3', rpm: 'tcsh/tcsh-6.11-3.aix5.1.ppc.rpm' },
          'texinfo' => { version: '4.6-1', rpm: 'texinfo/texinfo-4.6-1.aix5.1.ppc.rpm' },
          'tkinter' => { version: '2.7.5-1', rpm: 'python/tkinter-2.7.5-1.aix6.1.ppc.rpm' },
          'traceroute' => { version: '1.4a12-2', rpm: 'traceroute/traceroute-1.4a12-2.aix4.3.ppc.rpm' },
          'trueprint' => { version: '5.3-1', rpm: 'trueprint/trueprint-5.3-1.aix4.3.ppc.rpm' },
          'unzip' => { version: '5.51-1', rpm: 'unzip/unzip-5.51-1.aix5.1.ppc.rpm' },
          'urw-fonts' => { version: '2.0-1', rpm: 'urw-fonts/urw-fonts-2.0-1.aix4.3.noarch.rpm' },
          'vim-common' => { version: '6.3-1', rpm: 'vim/vim-common-6.3-1.aix5.1.ppc.rpm' },
          'vim-enhanced' => { version: '6.3-1', rpm: 'vim/vim-enhanced-6.3-1.aix5.1.ppc.rpm' },
          'vim-minimal' => { version: '6.3-1', rpm: 'vim/vim-minimal-6.3-1.aix5.1.ppc.rpm' },
          'vim-X11' => { version: '6.3-1', rpm: 'vim/vim-X11-6.3-1.aix5.1.ppc.rpm' },
          'vnc' => { version: '3.3.3r2-6', rpm: 'vnc/vnc-3.3.3r2-6.aix5.1.ppc.rpm' },
          'vte-devel' => { version: '0.11.10-1', rpm: 'vte/vte-devel-0.11.10-1.aix5.1.ppc.rpm' },
          'vte' => { version: '0.11.10-1', rpm: 'vte/vte-0.11.10-1.aix5.1.ppc.rpm' },
          'wget' => { version: '1.9.1-1', rpm: 'wget/wget-1.9.1-3.aix6.1.ppc.rpm' },
          'which' => { version: '2.14-1', rpm: 'which/which-2.14-1.aix5.1.ppc.rpm' },
          'wu-ftpd' => { version: '2.6.2-6', rpm: 'wu-ftpd/wu-ftpd-2.6.2-6.aix5.1.ppc.rpm' },
          'Xaw3d-devel' => { version: '1.5-4', rpm: 'Xaw3d/Xaw3d-devel-1.5-4.aix5.1.ppc.rpm' },
          'Xaw3d' => { version: '1.5-4', rpm: 'Xaw3d/Xaw3d-1.5-4.aix5.1.ppc.rpm' },
          'xcursor-devel' => { version: '1.1.7-3', rpm: 'xcursor/xcursor-devel-1.1.7-3.aix5.2.ppc.rpm' },
          'xcursor' => { version: '1.1.7-3', rpm: 'xcursor/xcursor-1.1.7-3.aix5.2.ppc.rpm' },
          'xemacs-el' => { version: '21.1.14-2', rpm: 'xemacs/xemacs-el-21.1.14-2.aix6.1.ppc.rpm' },
          'xemacs-info' => { version: '21.1.14-2', rpm: 'xemacs/xemacs-info-21.1.14-2.aix6.1.ppc.rpm' },
          'xemacs' => { version: '21.1.14-2', rpm: 'xemacs/xemacs-21.1.14-2.aix6.1.ppc.rpm' },
          'xft' => { version: '2.1.6-5', rpm: 'xft/xft-2.1.6-5.aix5.1.ppc.rpm' },
          'xpdf' => { version: '1.00-1', rpm: 'xpdf/xpdf-1.00-1.aix4.3.ppc.rpm' },
          'xpm-devel' => { version: '3.4k-8', rpm: 'xpm/xpm-devel-3.4k-8.aix6.1.ppc.rpm' },
          'xpm' => { version: '3.4k-8', rpm: 'xpm/xpm-3.4k-8.aix5.2.ppc.rpm' },
          'xpm' => { version: '3.4k-8', rpm: 'xpm/xpm-3.4k-8.aix6.1.ppc.rpm' },
          'xrender' => { version: '0.9.1-3', rpm: 'xrender/xrender-0.9.1-3.aix5.2.ppc.rpm' },
          'xscreensaver' => { version: '4.06-2', rpm: 'xscreensaver/xscreensaver-4.06-2.aix5.1.ppc.rpm' },
          'yelp' => { version: '2.4.0-1', rpm: 'yelp/yelp-2.4.0-1.aix5.1.ppc.rpm' },
          'zip' => { version: '2.3-3', rpm: 'zip/zip-2.3-3.aix4.3.ppc.rpm' },
          'zlib-devel' => { version: '1.2.7-1', rpm: 'zlib/zlib-devel-1.2.7-1.aix6.1.ppc.rpm' },
          'zlib' => { version: '1.2.7-1', rpm: 'zlib/zlib-1.2.7-1.aix6.1.ppc.rpm' },
          'zoo' => { version: '2.10-5', rpm: 'zoo/zoo-2.10-5.aix5.1.ppc.rpm' },
          'zsh' => { version: '4.0.4-3', rpm: 'zsh/zsh-4.0.4-3.aix5.1.ppc.rpm' },
        }

        "#{base_url}/#{pkgmap[pkg][:rpm]}" if pkgmap.key?(pkg)
      end
    end
  end
end
