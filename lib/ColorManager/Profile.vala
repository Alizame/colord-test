using Gee;

namespace Color {


    public class Profile : Object {
        /* Fields */
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

        // don't add:
        //          - Mode (virtual, physical unknown) : even colormgr doesn't show this




        /* Constructor */
        public Profile(ObjectPath path) throws IOError {
            this.path = path;

            this.p = Bus.get_proxy_sync(
            BusType.SYSTEM, // bus
                "org.freedesktop.ColorManager", // interface
                this.path // objpath
            );

            this.kind = p.kind;
            this.title = p.title;

            this.owner = p.owner;
            this.format = p.format;
            this.qualifier = p.qualifier;
            this.colorspace = p.colorspace;
            this.has_vcgt = p.has_vcgt;
            this.is_system_wide = p.is_system_wide;

        }


        /* Methods */
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
    }


}

