using Gee;

namespace ColorManager {


    public class Profile : Object {
        private ObjectPath path;
        private org.freedesktop.Profile d;

        private string kind;
        private string title;

        public string to_string() {
            return " %s: %s".printf(kind, title);
        }

        public ObjectPath get_objectpath() {
            return this.path;
        }
        public string get_kind() {
            return this.kind;
        }
        public string get_title() {
            return this.title;
        }


        public Profile(ObjectPath path) throws IOError {
            this.path = path;

            this.d = Bus.get_proxy_sync(
            BusType.SYSTEM, // bus
                "org.freedesktop.ColorManager", // interface
                this.path // objpath
            );

            this.kind = this.d.kind;
            this.title = this.d.title;
        }
    }


}
