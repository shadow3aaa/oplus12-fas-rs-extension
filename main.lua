API_VERSION = 1

function set_sf_backdoor(level)
    os.execute(string.format("service call SurfaceFlinger 1035 i32 %u 2>&1 >/dev/null", level))
end

function set_offset(policy0, policy2, policy5, policy7)
    set_policy_freq_offset(0, policy0)
    set_policy_freq_offset(2, policy2)
    set_policy_freq_offset(5, policy5)
    set_policy_freq_offset(7, policy7)
end

set_sf_backdoor(2)

function load_fas(pid, pkg)
    set_sf_backdoor(3)
    if (pkg == "com.miHoYo.Yuanshen")
    then
        set_offset(0, 0, -800000, 0)
    end
end

function unload_fas()
    set_sf_backdoor(2)
    set_offset(0, 0, 0, 0)
end
