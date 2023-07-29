local status, autotag = pcall(require, 'nvim-ts-autotag')
if (not status) then
    print("TS autotag not found")
    return
end

autotag.setup {}
