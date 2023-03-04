#!/usr/bin/env luajit

if not jit then
	-- Lame implementation using largely untested code
	local sh = require("mca.sh")
	local unpack = table.unpack or unpack

	return {
		send = function(title, message, id)
			if title and not message then
				error("title provided but not message", 2)
			end

			local cmd = {"notify-send"}
			if id then
				cmd[#cmd+1] = "-r"
				cmd[#cmd+1] = tostring(id)
			end
			if title then
				cmd[#cmd+1] = title
			end
			cmd[#cmd+1] = message

			sh.execute(unpack(cmd))
		end
	}
end

-- LuaJIT implementation using ffi
local ffi = require("ffi")

-- I've taken the liberty of switching some things to empty structs or void so
-- I don't have to also define the structs
-- I also didn't know where they were and didn't care enough to look
--
-- Also I really hate glib now.
ffi.cdef [[
/* gobject */
typedef int gint;
typedef gint gboolean;
typedef char gchar;
typedef void* gpointer;
typedef unsigned long gsize;

typedef void GError;
typedef gsize GType;

gpointer g_object_new(GType object_type, const gchar *first_property_name, ...);

void g_object_unref(gpointer object);

/* notify-send */
typedef struct {} NotifyNotification;

gboolean        notify_init(const char *app_name);
GType notify_notification_get_type(void);

gboolean notify_notification_show(NotifyNotification *notification, GError **error);
void notify_notification_set_timeout(NotifyNotification *notification, gint timeout);
]]

local notify = ffi.load("notify")
local glib = ffi.load("gobject-2.0.so")

notify.notify_init("mca")

local notify_type = notify.notify_notification_get_type()

return {
	send = function(title, message, id)
		local n = ffi.gc(
			glib.g_object_new(
				notify_type,
				"summary", title,
				"body", message,
				"id", ffi.cast(ffi.typeof("gint"), id or 0),
				nil
			),
			glib.g_object_unref
		)

		notify.notify_notification_show(n, nil)
	end
}
