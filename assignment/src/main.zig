const std = @import("std");

pub fn main() !void {
    const constant: i32 = 5;
    std.debug.print("constant\n", .{constant});
}

test "simple test" {
    const constant: i32 = 5;
    try std.testing.expect(constant == 5);
}
