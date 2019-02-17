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
        private Gtk.ListStore listmodel_devices = new Gtk.ListStore (2, typeof (string), typeof (string));
        private Gtk.ListStore listmodel_profiles = new Gtk.ListStore (2, typeof (string), typeof (string));
        private Gtk.ComboBox view_devices;
        private Gtk.ComboBox view_profiles;

        public Application () {
            Object(
                application_id: "com.github.alizame.colord-test",
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        protected override void activate () {
            var window = new Gtk.ApplicationWindow (this);
            var main = new Gtk.Grid ();



            view_devices = new ComboBox();
            view_profiles = new ComboBox();

            //view_devices.insert_column_with_attributes(-1, "Devices", new CellRendererText (), "text", 0);
            //view_profiles.insert_column_with_attributes(-1, "Profiles", new CellRendererText (), "text", 0);
            main.attach (view_devices, 0, 0, 1, 1);
            main.attach (view_profiles, 1, 0, 1, 1);



            window.set_title("colord-test");
            window.set_default_size (600, 300);
            window.add (main);
            window.show_all ();


            var devices_crt = new CellRendererText();
            var profiles_crt = new CellRendererText();


            view_devices.set_model(listmodel_devices);
            view_devices.set_active(1);
            view_devices.pack_start(devices_crt, true);
            view_devices.add_attribute(devices_crt, "text", 0);
            view_devices.changed.connect(sel_device_changed);

            view_profiles.set_model(listmodel_profiles);
            view_profiles.set_active(1);
            view_profiles.pack_start(profiles_crt, true);
            view_profiles.add_attribute(profiles_crt, "text", 0);
            view_profiles.changed.connect(sel_profile_changed);

            try {


                lib.ColorManager l_cm = new lib.ColorManager();
                stdout.printf(" %s\n", l_cm.to_string());

                Gtk.TreeIter d_iter;
                print("GetDevices: \n");
                foreach (var dev in l_cm.getDevices()) {
                    stdout.printf(" %s\n", dev.to_string());
                    listmodel_devices.append (out d_iter);
                    listmodel_devices.set (d_iter, 0, dev.to_string(), 1, dev.get_objectpath());
                }

                Gtk.TreeIter p_iter;
                print("GetProfiles: \n");
                foreach (var prof in l_cm.getProfiles()) {
                    stdout.printf(" %s\n", prof.to_string());
                    listmodel_profiles.append (out p_iter);
                    listmodel_profiles.set (p_iter, 0, prof.to_string(), 1, prof.get_objectpath());
                }


            }
            catch (DBusError e) {
                error(e.message);
            }
            catch (IOError e) {
                error(e.message);
            }

        }

        private void sel_device_changed()
        {
            Gtk.TreeIter iter;
            Value val;

            view_devices.get_active_iter(out iter);
            listmodel_devices.get_value(iter, 1, out val);

            stdout.printf("Device sel is '%s'\n", (string) val);
        }

        private void sel_profile_changed()
        {
            Gtk.TreeIter iter;
            Value val;

            view_profiles.get_active_iter(out iter);
            listmodel_profiles.get_value(iter, 1, out val);

            stdout.printf("Profile sel is '%s'\n", (string) val);
        }

        public static int main (string[] args) {
            var app = new colord_test.Application ();
            return app.run (args);
        }
    }
}
