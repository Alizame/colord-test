/* Generated by vala-dbus-binding-tool 1.0-aa2fb. Do not modify! */
/* Generated with: vala-dbus-binding-tool --api-path=ColorManager.Device.xml */
using GLib;

namespace org {

	namespace freedesktop {

		namespace ColorManager {

			[DBus (name = "org.freedesktop.ColorManager.Device", timeout = 120000)]
			public interface Device : GLib.Object {

				[DBus (name = "SetProperty")]
				public abstract void set_property(string property_name, string property_value) throws DBusError, IOError;

				[DBus (name = "AddProfile")]
				public abstract void add_profile(string relation, GLib.ObjectPath object_path) throws DBusError, IOError;

				[DBus (name = "RemoveProfile")]
				public abstract void remove_profile(GLib.ObjectPath object_path) throws DBusError, IOError;

				[DBus (name = "MakeProfileDefault")]
				public abstract void make_profile_default(GLib.ObjectPath profile_path) throws DBusError, IOError;

				[DBus (name = "GetProfileForQualifiers")]
				public abstract GLib.ObjectPath get_profile_for_qualifiers(string[] qualifiers) throws DBusError, IOError;

				[DBus (name = "GetProfileRelation")]
				public abstract string get_profile_relation(GLib.ObjectPath object_path) throws DBusError, IOError;

				[DBus (name = "ProfilingInhibit")]
				public abstract void profiling_inhibit() throws DBusError, IOError;

				[DBus (name = "ProfilingUninhibit")]
				public abstract void profiling_uninhibit() throws DBusError, IOError;

				[DBus (name = "SetEnabled")]
				public abstract void set_enabled(bool enabled) throws DBusError, IOError;

				[DBus (name = "Changed")]
				public signal void changed();

				[DBus (name = "Created")]
				public abstract uint64 created {  get; }

				[DBus (name = "Modified")]
				public abstract uint64 modified {  get; }

				[DBus (name = "Model")]
				public abstract string model { owned get; }

				[DBus (name = "Serial")]
				public abstract string serial { owned get; }

				[DBus (name = "Vendor")]
				public abstract string vendor { owned get; }

				[DBus (name = "Colorspace")]
				public abstract string colorspace { owned get; }

				[DBus (name = "Kind")]
				public abstract string kind { owned get; }

				[DBus (name = "DeviceId")]
				public abstract string device_id { owned get; }

				[DBus (name = "Profiles")]
				public abstract GLib.ObjectPath[] profiles { owned get; }

				[DBus (name = "Mode")]
				public abstract string mode { owned get; }

				[DBus (name = "Format")]
				public abstract string format { owned get; }

				[DBus (name = "Scope")]
				public abstract string scope { owned get; }

				[DBus (name = "Owner")]
				public abstract uint owner {  get; }

				[DBus (name = "Enabled")]
				public abstract bool enabled {  get; }

				[DBus (name = "Seat")]
				public abstract string seat { owned get; }

				[DBus (name = "Embedded")]
				public abstract bool embedded {  get; }

				[DBus (name = "Metadata")]
				public abstract GLib.HashTable<string, string> metadata { owned get; }

				[DBus (name = "ProfilingInhibitors")]
				public abstract string[] profiling_inhibitors { owned get; }
			}

			[DBus (name = "org.freedesktop.ColorManager.Device", timeout = 120000)]
			public interface DeviceSync : GLib.Object {

				[DBus (name = "SetProperty")]
				public abstract void set_property(string property_name, string property_value) throws DBusError, IOError;

				[DBus (name = "AddProfile")]
				public abstract void add_profile(string relation, GLib.ObjectPath object_path) throws DBusError, IOError;

				[DBus (name = "RemoveProfile")]
				public abstract void remove_profile(GLib.ObjectPath object_path) throws DBusError, IOError;

				[DBus (name = "MakeProfileDefault")]
				public abstract void make_profile_default(GLib.ObjectPath profile_path) throws DBusError, IOError;

				[DBus (name = "GetProfileForQualifiers")]
				public abstract GLib.ObjectPath get_profile_for_qualifiers(string[] qualifiers) throws DBusError, IOError;

				[DBus (name = "GetProfileRelation")]
				public abstract string get_profile_relation(GLib.ObjectPath object_path) throws DBusError, IOError;

				[DBus (name = "ProfilingInhibit")]
				public abstract void profiling_inhibit() throws DBusError, IOError;

				[DBus (name = "ProfilingUninhibit")]
				public abstract void profiling_uninhibit() throws DBusError, IOError;

				[DBus (name = "SetEnabled")]
				public abstract void set_enabled(bool enabled) throws DBusError, IOError;

				[DBus (name = "Changed")]
				public signal void changed();

				[DBus (name = "Created")]
				public abstract uint64 created {  get; }

				[DBus (name = "Modified")]
				public abstract uint64 modified {  get; }

				[DBus (name = "Model")]
				public abstract string model { owned get; }

				[DBus (name = "Serial")]
				public abstract string serial { owned get; }

				[DBus (name = "Vendor")]
				public abstract string vendor { owned get; }

				[DBus (name = "Colorspace")]
				public abstract string colorspace { owned get; }

				[DBus (name = "Kind")]
				public abstract string kind { owned get; }

				[DBus (name = "DeviceId")]
				public abstract string device_id { owned get; }

				[DBus (name = "Profiles")]
				public abstract GLib.ObjectPath[] profiles { owned get; }

				[DBus (name = "Mode")]
				public abstract string mode { owned get; }

				[DBus (name = "Format")]
				public abstract string format { owned get; }

				[DBus (name = "Scope")]
				public abstract string scope { owned get; }

				[DBus (name = "Owner")]
				public abstract uint owner {  get; }

				[DBus (name = "Enabled")]
				public abstract bool enabled {  get; }

				[DBus (name = "Seat")]
				public abstract string seat { owned get; }

				[DBus (name = "Embedded")]
				public abstract bool embedded {  get; }

				[DBus (name = "Metadata")]
				public abstract GLib.HashTable<string, string> metadata { owned get; }

				[DBus (name = "ProfilingInhibitors")]
				public abstract string[] profiling_inhibitors { owned get; }
			}
		}
	}
}
