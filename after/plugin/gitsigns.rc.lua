local status, gitsigns = pcall(require, 'gitsigns')
if (not status) then
    print("Git signs not found")
    return
end

gitsigns.setup {}
