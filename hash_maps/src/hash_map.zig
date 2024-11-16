const std = @import("std");

test "hashing" {
    const Point = struct { x: i32, y: i32 };

    var map = std.AutoHashMap(i32, Point).init(
        std.heap.page_allocator,
    );
    defer map.deinit();

    try map.put(1524, .{ .x = 1, .y = -4 });
    try map.put(13, .{ .x = 1, .y = 1 });
    try map.put(-2, .{ .x = 0, .y = 0 });

    var it = map.iterator();
    while (it.next()) |entry| {
        std.debug.print("Key: {}, Value {}\n", .{ entry.key_ptr.*, entry.value_ptr.* });
    }

    try map.put(-2, .{ .x = 100, .y = 0 });

    it = map.iterator();
    while (it.next()) |entry| {
        std.debug.print("Key: {}, Value {}\n", .{ entry.key_ptr.*, entry.value_ptr.* });
    }
}
