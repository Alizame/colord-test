/*
* Copyright (c) {{yearrange}} Maximilian ()
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Maximilian <>
*/
using Granite;
using Granite.Widgets;
using Gtk;
using Gee;

namespace colord_test {
    public class Application : Granite.Application {

        public Application () {
            Object(
                application_id: "com.github.alizame.colord-test",
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        protected override void activate () {
            var window = new Gtk.ApplicationWindow (this);
            var main = new Gtk.Grid ();

            window.set_title("colord-test");
            window.set_default_size (300, 300);
            window.add (main);
            window.show_all ();

            try {
                org.freedesktop.ColorManager cm = Bus.get_proxy_sync(
                BusType.SYSTEM,
                "org.freedesktop.ColorManager",
                "/org/freedesktop/ColorManager"
                );

                print("GetDevices: \n");

                ////////////////////////////////////////////////////////
                var cm_devices = cm.get_devices(); // get device objectpath from dbus-interface


            }
            catch (DBusError e) {
                error(e.message);
            }
            catch (IOError e) {
                error(e.message);
            }

            print("End\n");
        }

        public static int main (string[] args) {
            var app = new colord_test.Application ();
            return app.run (args);
        }
    }
}
