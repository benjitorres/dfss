const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "dfss",
        .root_source_file = .{ .cwd_relative = b.pathFromRoot("src/main.zig") },
        .target = target,
        .optimize = optimize,
    });
    
    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
