# ColorD-Test
##### Made for [elementary OS](https://elementary.io)

## Developing and Building

If you want to hack on and build it yourself, you'll need the following dependencies:

* libgtk-3-dev
* meson
* valac
* colord
* colord-gtk
* granite (?)

Run `meson build` to configure the build environment and run `ninja test` to build and run automated tests

    meson build
    cd build
    ninja test // there are no tests at this point.
    

After building is complete, execute with `com.github.alizame.colord-test`


