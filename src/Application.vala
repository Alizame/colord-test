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
        private Gtk.TreeStore model_devices = new Gtk.TreeStore (2, typeof (string), typeof(Object)); //;typeof (Color.Device));
        private Gtk.ListStore model_profiles = new Gtk.ListStore (2, typeof (string), typeof (Color.Profile));

        private Gtk.TreeView view_devices;
        private Gtk.ComboBox view_profiles;

        private Color.ColorManager l_cm = new Color.ColorManager();

        public Application () {
            Object(
                application_id: "com.github.alizame.colord-test",
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        private void gen_dev_model() {
            model_devices.clear();

            try {
                stdout.printf(" %s\n", l_cm.to_string());

                Gtk.TreeIter d_iter;
                //print("GetDevices: \n");
                foreach (var dev in l_cm.getDevices()) {
                    var dev_profiles  = dev.getProfiles();
                    Gtk.TreeIter d_p_iter;
                    //stdout.printf(" %s\n", dev.to_string());
                    model_devices.append (out d_iter, null);
                    model_devices.set (d_iter, 0, dev.to_string(), 1, dev);

                    foreach (var prof in dev_profiles) {
                        model_devices.append(out d_p_iter, d_iter);
                        model_devices.set(d_p_iter, 0, prof.to_string(), 1, prof);
                    }
                }

                Gtk.TreeIter p_iter;
                //print("GetProfiles: \n");
                foreach (var prof in l_cm.getProfiles()) {
                    //stdout.printf(" %s\n", prof.to_string());
                    model_profiles.append (out p_iter);
                    model_profiles.set (p_iter, 0, prof.to_string(), 1, prof);
                }


            }
            catch (DBusError e) {
                error(e.message);
            }
            catch (IOError e) {
                error(e.message);
            }
        }

        protected override void activate () {
            var window = new Gtk.ApplicationWindow (this);
            var main = new Gtk.Grid ();
            main.halign = Gtk.Align.CENTER;
            main.valign = Gtk.Align.CENTER;
            main.vexpand = true;
            main.orientation = Gtk.Orientation.HORIZONTAL;
            main.halign = Gtk.Align.CENTER;
            main.column_spacing = 24;
            main.row_spacing = 12;
            main.margin = 12;

            Gtk.Frame frame = new Gtk.Frame(null);


            view_devices = new TreeView();
            frame.add(view_devices);
            view_profiles = new ComboBox();

            //view_devices.insert_column_with_attributes(-1, "Devices", new CellRendererText (), "text", 0);
            //view_profiles.insert_column_with_attributes(-1, "Profiles", new CellRendererText (), "text", 0);

            //main.add (view_devices);//, 0, 0, 1, 1);
            main.add(frame);
            main.add (new Gtk.Separator (Gtk.Orientation.VERTICAL));
            main.add (view_profiles);//, 1, 0, 1, 1);



            window.set_title("colord-test");
            window.set_default_size (600, 300);
            window.add (main);
            window.show_all ();


            var devices_crt = new CellRendererText();
            var profiles_crt = new CellRendererText();


            gen_dev_model();
            view_devices.set_model(model_devices);
            view_devices.insert_column_with_attributes (-1, "Device", devices_crt, "text", 0);
            view_devices.set_headers_visible(false);

            //view_devices.set_active(1);
            //view_devices.pack_start(devices_crt, true);
            //view_devices.add_attribute(devices_crt, "text", 0);
            view_devices.cursor_changed.connect(sel_device_changed);

            view_profiles.set_model(model_profiles);
            view_profiles.set_active(1);
            view_profiles.pack_start(profiles_crt, true);
            view_profiles.add_attribute(profiles_crt, "text", 0);
            view_profiles.changed.connect(sel_profile_changed);



        }

        private void sel_device_changed()
        {
            Gtk.TreeIter position_iter;
            Gtk.TreePath current_treepath;
            Gtk.TreeViewColumn selected_col;
            Object my_val;
            Color.Profile p_val;
            Color.Device d_val;

            // get selected entry
            view_devices.get_cursor(out current_treepath, out selected_col);
            model_devices.get_iter(out position_iter, current_treepath);
            model_devices.get(position_iter, 1, out my_val);

            // trying to identify if it is a Device or a Profile
            if ( my_val.get_type().is_a(typeof(Color.Profile)) ) { // selection is a Profile
                p_val = (Color.Profile) my_val;
                stdout.printf("Profile sel is '%s'\n", p_val.to_string());
            }
            else if ( my_val.get_type().is_a(typeof(Color.Device)) ) { // is a Device
                d_val = (Color.Device) my_val;
                stdout.printf("Device sel is '%s'\n", d_val.get_objectpath());
            }
            else {
                warning("sel_device_changed() error, wrong type selected + "
                + my_val.get_type().name().to_string());
            }
        }

        private void sel_profile_changed()
        {
            Gtk.TreeIter iter;
            GLib.Value val;

            view_profiles.get_active_iter(out iter);
            model_profiles.get_value(iter, 1, out val);

            stdout.printf("Profile sel is '%s'\n", ((Color.Profile) val).get_objectpath());
        }

        public static int main (string[] args) {
            var app = new colord_test.Application ();
            return app.run (args);
        }
    }
}
