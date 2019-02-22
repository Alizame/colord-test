using Gee;

namespace Color {


    public class Profile : Object {
        private ObjectPath path;
        private org.freedesktop.Profile p;

        private string kind; // enum kind?
        private string title;

        private uint owner;
        private string format;
        private string qualifier;
        private string colorspace;
        private bool has_vcgt;
        private bool is_system_wide;

        // Todo: Add:
        //          - owner uint : this only the UID of the user ;(
        //          - format
        //          - qualifier
        //          - colorspace
        //          - vcgt
        //          - systemwide
        // don't add:
        //          - Mode (virtual, physicalm unknown) : even colormgr doesn't show this

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

            this.p = Bus.get_proxy_sync(
            BusType.SYSTEM, // bus
                "org.freedesktop.ColorManager", // interface
                this.path // objpath
            );

            this.kind = this.p.kind;
            this.title = this.p.title;
        }
    }


}
