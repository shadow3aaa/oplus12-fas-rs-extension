-- fas-rs 使用它来提供指定版本的api
-- fas-rs use this to provide version-specified api
API_VERSION = 0
--
-- 中文:
-- 该枚举对应的lua函数
-- 在 fas-rs 中将被 fas-rs 回调
-- pub enum CallBacks {
--  LoadFas(pid_t, String), --------> function load_fas(pid, pkg)
--  UnloadFas(pid_t, String), ------> function unload_fas(pid, pkg)
--  StartFas, ----------------------> function start_fas()
--  StopFas, -----------------------> function stop_fas()
--  InitCpuFreq, -------------------> function init_cpu_freq()
--  ResetCpuFreq, ------------------> function reset_cpu_freq()
-- }
--
-- 可注册的函数说明:
-- function load_fas(pid, pkg)
-- 当 fas-rs 加载到目标游戏时调用，
-- 参数为目标应用程序的pid和包名
--
-- function unload_fas(pid, pkg)
-- 当 fas-rs 卸载到目标游戏时调用，
-- 参数为目标应用程序的pid和包名
--
-- function start_fas()
-- 切换到fas-rs工作状态时调用。
--
-- function stop_fas()
-- 切换到 fas-rs 不工作状态时调用。
--
-- function init_cpu_freq()
-- 当cpu控制器进入控制状态时调用。
--
-- function reset_cpu_freq()
-- 当cpu控制器退出控制状态时调用。
--
-- 附加: 在函数外的lua代码会在插件加载时被执行，
-- 如果你有执行初始化内容的需求，这样做很方便。
--
-- fas-rs提供的函数:
-- log_info("message")
-- 打印一个info等级日志到/sdcard/Android/fas-rs/fas_log.txt
--
-- log_error("message")
-- 打印一个error等级日志到/sdcard/Android/fas-rs/fas_log.txt
--
-- log_debug("message")
-- 打印一个debug等级日志到/sdcard/Android/fas-rs/fas_log.txt，
-- 此等级在fas-rs的release build不开启
--
-- ------------------------------------
--
-- EN:
-- The lua function corresponding to this enumeration
-- in fas-rs will be called back by fas-rs
-- pub enum CallBacks {
--  LoadFas(pid_t, String), --------> function load_fas(pid, pkg)
--  UnloadFas(pid_t, String), ------> function unload_fas(pid, pkg)
--  StartFas, ----------------------> function start_fas()
--  StopFas, -----------------------> function stop_fas()
--  InitCpuFreq, -------------------> function init_cpu_freq()
--  ResetCpuFreq, ------------------> function reset_cpu_freq()
-- }
--
-- Registerable function description:
-- function load_fas(pid, pkg)
-- Called when fas-rs is loaded into the target game,
-- The parameters are the pid and package name of the target application
--
-- function unload_fas(pid, pkg)
-- Called when fas-rs is unloaded to the target game,
-- The parameters are the pid and package name of the target application
--
-- function start_fas()
-- Called when switching to fas-rs working state.
--
-- function stop_fas()
-- Called when switching to fas-rs not-working state.
--
-- function init_cpu_freq()
-- Called when the cpu controller enters the control state.
--
-- function reset_cpu_freq()
-- Called when the cpu controller exits the control state.
--
-- Extra: Lua code outside the function will be
-- executed when the extension is loaded, if you need to
-- execute initialization content, this is convenient.
--
-- Functions provided by fas-rs:
-- log_info("message")
-- Print an info level log to /sdcard/Android/fas-rs/fas_log.txt
--
-- log_error("message")
-- Print an error level log to /sdcard/Android/fas-rs/fas_log.txt
--
-- log_debug("message")
-- Print a debug level log to /sdcard/Android/fas-rs/fas_log.txt,
-- This level is not enabled in the release build of fas-rs.
--
function set_sf_backdoor(level)
    os.execute(string.format("service call SurfaceFlinger 1035 i32 %u 2>&1 >/dev/null", level))
end

set_sf_backdoor(2)

function load_fas(pid, pkg)
    set_sf_backdoor(3)
end

function unload_fas()
    set_sf_backdoor(2)
end
