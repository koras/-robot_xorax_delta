-- scriptTest.lua (in your scripts directory)
local M = {}

local dataLog = getScriptPath() .. "\\log\\dataLog.txt";
local logSignal = getScriptPath() .. "\\log\\EventLog.txt";

local Log = {}

function Log:new(_setting)
    
    -- свойства
    local obj= {}

    local function _saveFile(file, text)
        
        if(text ~= nil)then 
            f = io.open(file, "a");
            if f == nil then
                f = io.open(file, "w");
                f:close();
                f = io.open(file, "a");
            end
            f:write(text .. "\n")
            -- Закрывает файл
            f:close();
        end

    end

    -- I try to open this file
    function obj:save(txt, models)
        local  modelName = ''
        if(txt == nil) then 
            return;
        end
        if(models ~= nil) then 
            modelName = ' :'.. models 
        end
        text  = txt .. ' '.. modelName
        _saveFile(dataLog, text) 
    end

    -- I try to open this file
    function obj:saveSignal(text) 
        _saveFile(logSignal, text) 
    end 
    
        setmetatable(obj, self)
        self.__index = self; return obj

end 
return Log
