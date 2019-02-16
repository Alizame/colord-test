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


            var listmodel_devices = new Gtk.ListStore(1, typeof(string));
            var listmodel_profiles = new Gtk.ListStore(1, typeof(string));

            var view_devices = new TreeView();
            var view_profiles = new TreeView();
            view_devices.set_model(listmodel_devices);
            view_profiles.set_model(listmodel_profiles);

            view_devices.insert_column_with_attributes(-1, "Devices", new CellRendererText (), "text", 0);
            view_profiles.insert_column_with_attributes(-1, "Profiles", new CellRendererText (), "text", 0);
            main.attach (view_devices, 0, 0, 1, 1);
            main.attach (view_profiles, 1, 0, 1, 1);



            window.set_title("colord-test");
            window.set_default_size (600, 300);
            window.add (main);
            window.show_all ();


            try {


                lib.ColorManager l_cm = new lib.ColorManager();
                stdout.printf(" %s\n", l_cm.to_string());

                TreeIter d_iter;
                print("GetDevices: \n");
                foreach (var dev in l_cm.getDevices()) {
                    stdout.printf(" %s\n", dev.to_string());
                    listmodel_devices.append (out d_iter);
                    listmodel_devices.set (d_iter, 0, dev.to_string());
                }

                TreeIter p_iter;
                print("GetProfiles: \n");
                foreach (var prof in l_cm.getProfiles()) {
                    stdout.printf(" %s\n", prof.to_string());
                    listmodel_profiles.append (out p_iter);
                    listmodel_profiles.set (p_iter, 0, prof.to_string());
                }


            }
            catch (DBusError e) {
                error(e.message);
            }
            catch (IOError e) {
                error(e.message);
            }


        }

        public static int main (string[] args) {
            var app = new colord_test.Application ();
            return app.run (args);
        }
    }
}
