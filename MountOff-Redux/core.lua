SLASH_MOUNTOFF1 = '/mountoff'
function SlashCmdList.MOUNTOFF (args)
    if args == "help" then
        SendSystemMessage("/mountoff [help] - without parameters: mounts the same mount as the target, if available.  With the 'help' parameter: prints this message.")
        return
    end
	if UnitIsPlayer("target") then
		local buff = nil
		local mount = nil
		for i = 1,40 do
            buff = C_TooltipInfo.GetUnitBuff("target",i)
			if buff and buff.id then
				mount = C_MountJournal.GetMountFromSpell(buff.id)
				if mount and C_MountJournal.GetMountUsabilityByID(mount, true) then
					C_MountJournal.SummonByID(mount)
					break
                elseif mount and C_MountJournal.GetMountUsabilityByID(mount, false) then
                    print("You can ride the same mount as your target... if you go outside.")
                    break
				elseif mount then
					print("Target is riding a mount you cannot use.")
                    break
				end
			end
		end
	end
--    local id = C_MountJournal.GetMountIDs();
--    for i = 1, 40 do
--        local b = C_TooltipInfo.GetUnitBuff("target", i);
--        if b == nil then break end
--        b = b.id
--        for _, v in pairs(id) do
--            local x, n = C_MountJournal.GetMountInfoByID(v)
--            if b == n then
--                C_MountJournal.SummonByID(v)
--                break
--            end
--        end
--    end
end
