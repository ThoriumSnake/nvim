local M = {}
local grapple = require("grapple")
local utils = require("utils.common")

local function get_tag_names(tags)
    local clean_tags = {}
    for i = 1, #tags do
        if i > 4 then break end
        --Gets last directory or file in path
        clean_tags[i] = string.match(tags[i].path, "^.+/(.+)$")
    end

    return clean_tags
end

local function mark_active_name(names)
    local active = grapple.name_or_index()
    -- utils.print_table(active)

    for i = 1, #names do
        -- if names[i] == active or i == active then
        -- Checking only for index as checking for name is kind of a pain if I have to consider duplicates and what-not
        if i == active then
            local selected = "--"..names[i].."--"
            names[i] = selected
            break
        end
    end

    return names
end

local function get_duplicate_names(names)
    local duplicates = {}
    for i = 1, #names do
        for k = i + 1, #names do
            if names[i] == names[k] then
                duplicates[names[i]] = true
            end
        end
    end

    return duplicates
end

local function mark_duplicate_names(names)
    local duplicates = get_duplicate_names(names)
    local full_paths = grapple.tags()
    local marked = {}
    for i = 1, #names do
        marked[i] = names[i]
        if duplicates[names[i]] then
            --Gets last dir/file and the parent folder
            marked[i] = string.match(full_paths[i].path, "^/?.+/(.+/.+)$")
        end
    end

    return marked
end

M.statusline = function()
    local clean_tags = get_tag_names(grapple.tags())
    clean_tags = mark_duplicate_names(clean_tags)
    clean_tags = mark_active_name(clean_tags)
    if #clean_tags < 1 then return "󰛢 [No Tags]" end
    if grapple.exists() then
        return "[ "..table.concat(clean_tags, "  ").." ]"
    end
    return "󰛢 ".."[ "..table.concat(clean_tags, "  ").." ]"
end

return M
-- utils.print_table(get_tag_names(grapple.tags()))
-- utils.print_table(table.concat(get_tag_names(grapple.tags()), "  "))
