/* Generated by vala-dbus-binding-tool 1.0-aa2fb. Do not modify! */
/* Generated with: vala-dbus-binding-tool --api-path=ColorManager.xml */
using GLib;

namespace org {

	namespace freedesktop {

		[DBus (name = "org.freedesktop.ColorManager", timeout = 120000)]
		public interface ColorManager : GLib.Object {

			[DBus (name = "GetDevices")]
			public abstract GLib.ObjectPath[] get_devices() throws DBusError, IOError;

			[DBus (name = "GetDevicesByKind")]
			public abstract GLib.ObjectPath[] get_devices_by_kind(string kind) throws DBusError, IOError;

			[DBus (name = "FindDeviceById")]
			public abstract GLib.ObjectPath find_device_by_id(string device_id) throws DBusError, IOError;

			[DBus (name = "FindSensorById")]
			public abstract GLib.ObjectPath find_sensor_by_id(string sensor_id) throws DBusError, IOError;

			[DBus (name = "FindDeviceByProperty")]
			public abstract GLib.ObjectPath find_device_by_property(string key, string value) throws DBusError, IOError;

			[DBus (name = "FindProfileById")]
			public abstract GLib.ObjectPath find_profile_by_id(string profile_id) throws DBusError, IOError;

			[DBus (name = "FindProfileByProperty")]
			public abstract GLib.ObjectPath find_profile_by_property(string key, string value) throws DBusError, IOError;

			[DBus (name = "FindProfileByFilename")]
			public abstract GLib.ObjectPath find_profile_by_filename(string filename) throws DBusError, IOError;

			[DBus (name = "GetStandardSpace")]
			public abstract GLib.ObjectPath get_standard_space(string standard_space) throws DBusError, IOError;

			[DBus (name = "GetProfiles")]
			public abstract GLib.ObjectPath[] get_profiles() throws DBusError, IOError;

			[DBus (name = "GetSensors")]
			public abstract GLib.ObjectPath[] get_sensors() throws DBusError, IOError;

			[DBus (name = "GetProfilesByKind")]
			public abstract GLib.ObjectPath[] get_profiles_by_kind(string kind) throws DBusError, IOError;

			[DBus (name = "CreateProfile")]
			public abstract GLib.ObjectPath create_profile(string profile_id, string scope, GLib.HashTable<string, string> properties) throws DBusError, IOError;

			[DBus (name = "CreateDevice")]
			public abstract GLib.ObjectPath create_device(string device_id, string scope, GLib.HashTable<string, string> properties) throws DBusError, IOError;

			[DBus (name = "DeleteDevice")]
			public abstract void delete_device(GLib.ObjectPath object_path) throws DBusError, IOError;

			[DBus (name = "DeleteProfile")]
			public abstract void delete_profile(GLib.ObjectPath object_path) throws DBusError, IOError;

			[DBus (name = "Changed")]
			public signal void changed();

			[DBus (name = "DeviceAdded")]
			public signal void device_added(GLib.ObjectPath object_path);

			[DBus (name = "DeviceRemoved")]
			public signal void device_removed(GLib.ObjectPath object_path);

			[DBus (name = "DeviceChanged")]
			public signal void device_changed(GLib.ObjectPath object_path);

			[DBus (name = "ProfileAdded")]
			public signal void profile_added(GLib.ObjectPath object_path);

			[DBus (name = "ProfileRemoved")]
			public signal void profile_removed(GLib.ObjectPath object_path);

			[DBus (name = "SensorAdded")]
			public signal void sensor_added(GLib.ObjectPath object_path);

			[DBus (name = "SensorRemoved")]
			public signal void sensor_removed(GLib.ObjectPath object_path);

			[DBus (name = "ProfileChanged")]
			public signal void profile_changed(GLib.ObjectPath object_path);

			[DBus (name = "DaemonVersion")]
			public abstract string daemon_version { owned get; }

			[DBus (name = "SystemVendor")]
			public abstract string system_vendor { owned get; }

			[DBus (name = "SystemModel")]
			public abstract string system_model { owned get; }
		}

		[DBus (name = "org.freedesktop.ColorManager", timeout = 120000)]
		public interface ColorManagerSync : GLib.Object {

			[DBus (name = "GetDevices")]
			public abstract GLib.ObjectPath[] get_devices() throws DBusError, IOError;

			[DBus (name = "GetDevicesByKind")]
			public abstract GLib.ObjectPath[] get_devices_by_kind(string kind) throws DBusError, IOError;

			[DBus (name = "FindDeviceById")]
			public abstract GLib.ObjectPath find_device_by_id(string device_id) throws DBusError, IOError;

			[DBus (name = "FindSensorById")]
			public abstract GLib.ObjectPath find_sensor_by_id(string sensor_id) throws DBusError, IOError;

			[DBus (name = "FindDeviceByProperty")]
			public abstract GLib.ObjectPath find_device_by_property(string key, string value) throws DBusError, IOError;

			[DBus (name = "FindProfileById")]
			public abstract GLib.ObjectPath find_profile_by_id(string profile_id) throws DBusError, IOError;

			[DBus (name = "FindProfileByProperty")]
			public abstract GLib.ObjectPath find_profile_by_property(string key, string value) throws DBusError, IOError;

			[DBus (name = "FindProfileByFilename")]
			public abstract GLib.ObjectPath find_profile_by_filename(string filename) throws DBusError, IOError;

			[DBus (name = "GetStandardSpace")]
			public abstract GLib.ObjectPath get_standard_space(string standard_space) throws DBusError, IOError;

			[DBus (name = "GetProfiles")]
			public abstract GLib.ObjectPath[] get_profiles() throws DBusError, IOError;

			[DBus (name = "GetSensors")]
			public abstract GLib.ObjectPath[] get_sensors() throws DBusError, IOError;

			[DBus (name = "GetProfilesByKind")]
			public abstract GLib.ObjectPath[] get_profiles_by_kind(string kind) throws DBusError, IOError;

			[DBus (name = "CreateProfile")]
			public abstract GLib.ObjectPath create_profile(string profile_id, string scope, GLib.HashTable<string, string> properties) throws DBusError, IOError;

			[DBus (name = "CreateDevice")]
			public abstract GLib.ObjectPath create_device(string device_id, string scope, GLib.HashTable<string, string> properties) throws DBusError, IOError;

			[DBus (name = "DeleteDevice")]
			public abstract void delete_device(GLib.ObjectPath object_path) throws DBusError, IOError;

			[DBus (name = "DeleteProfile")]
			public abstract void delete_profile(GLib.ObjectPath object_path) throws DBusError, IOError;

			[DBus (name = "Changed")]
			public signal void changed();

			[DBus (name = "DeviceAdded")]
			public signal void device_added(GLib.ObjectPath object_path);

			[DBus (name = "DeviceRemoved")]
			public signal void device_removed(GLib.ObjectPath object_path);

			[DBus (name = "DeviceChanged")]
			public signal void device_changed(GLib.ObjectPath object_path);

			[DBus (name = "ProfileAdded")]
			public signal void profile_added(GLib.ObjectPath object_path);

			[DBus (name = "ProfileRemoved")]
			public signal void profile_removed(GLib.ObjectPath object_path);

			[DBus (name = "SensorAdded")]
			public signal void sensor_added(GLib.ObjectPath object_path);

			[DBus (name = "SensorRemoved")]
			public signal void sensor_removed(GLib.ObjectPath object_path);

			[DBus (name = "ProfileChanged")]
			public signal void profile_changed(GLib.ObjectPath object_path);

			[DBus (name = "DaemonVersion")]
			public abstract string daemon_version { owned get; }

			[DBus (name = "SystemVendor")]
			public abstract string system_vendor { owned get; }

			[DBus (name = "SystemModel")]
			public abstract string system_model { owned get; }
		}

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

		[DBus (name = "org.freedesktop.ColorManager.Profile", timeout = 120000)]
			public interface Profile : GLib.Object {

				[DBus (name = "SetProperty")]
				public abstract void set_property(string property_name, string property_value) throws DBusError, IOError;

				[DBus (name = "InstallSystemWide")]
				public abstract void install_system_wide() throws DBusError, IOError;

				[DBus (name = "Changed")]
				public signal void changed();

				[DBus (name = "ProfileId")]
				public abstract string profile_id { owned get; }

				[DBus (name = "Title")]
				public abstract string title { owned get; }

				[DBus (name = "Metadata")]
				public abstract GLib.HashTable<string, string> metadata { owned get; }

				[DBus (name = "Qualifier")]
				public abstract string qualifier { owned get; }

				[DBus (name = "Format")]
				public abstract string format { owned get; }

				[DBus (name = "Kind")]
				public abstract string kind { owned get; }

				[DBus (name = "Colorspace")]
				public abstract string colorspace { owned get; }

				[DBus (name = "HasVcgt")]
				public abstract bool has_vcgt {  get; }

				[DBus (name = "IsSystemWide")]
				public abstract bool is_system_wide {  get; }

				[DBus (name = "Filename")]
				public abstract string filename { owned get; }

				[DBus (name = "Created")]
				public abstract int64 created {  get; }

				[DBus (name = "Scope")]
				public abstract string scope { owned get; }

				[DBus (name = "Owner")]
				public abstract uint owner {  get; }

				[DBus (name = "Warnings")]
				public abstract string[] warnings { owned get; }
			}

			[DBus (name = "org.freedesktop.ColorManager.Profile", timeout = 120000)]
			public interface ProfileSync : GLib.Object {

				[DBus (name = "SetProperty")]
				public abstract void set_property(string property_name, string property_value) throws DBusError, IOError;

				[DBus (name = "InstallSystemWide")]
				public abstract void install_system_wide() throws DBusError, IOError;

				[DBus (name = "Changed")]
				public signal void changed();

				[DBus (name = "ProfileId")]
				public abstract string profile_id { owned get; }

				[DBus (name = "Title")]
				public abstract string title { owned get; }

				[DBus (name = "Metadata")]
				public abstract GLib.HashTable<string, string> metadata { owned get; }

				[DBus (name = "Qualifier")]
				public abstract string qualifier { owned get; }

				[DBus (name = "Format")]
				public abstract string format { owned get; }

				[DBus (name = "Kind")]
				public abstract string kind { owned get; }

				[DBus (name = "Colorspace")]
				public abstract string colorspace { owned get; }

				[DBus (name = "HasVcgt")]
				public abstract bool has_vcgt {  get; }

				[DBus (name = "IsSystemWide")]
				public abstract bool is_system_wide {  get; }

				[DBus (name = "Filename")]
				public abstract string filename { owned get; }

				[DBus (name = "Created")]
				public abstract int64 created {  get; }

				[DBus (name = "Scope")]
				public abstract string scope { owned get; }

				[DBus (name = "Owner")]
				public abstract uint owner {  get; }

				[DBus (name = "Warnings")]
				public abstract string[] warnings { owned get; }
			}


	}
}
