

-- scriptTest.lua (in your scripts directory)
local M = {}

-- table.remove (bid,j);

--    local O = t[i].open; -- Получить значение Open для указанной свечи (цена открытия свечи)
--    local H = t[i].high; -- Получить значение High для указанной свечи (наибольшая цена свечи)
--    local L = t[i].low; -- Получить значение Low для указанной свечи (наименьшая цена свечи)
--    local C = t[i].close; -- Получить значение Close для указанной свечи (цена закрытия свечи)
--    local V = t[i].volume; -- Получить значение Volume для указанной свечи (объем сделок в свече)
--    local T = t[i].datetime; -- Получить значение datetime для указанной свечи

local function last()

    local shift = 0;
    local len = 100;
    local number_of_candles = getNumCandles(setting.tag);
    local t, n, l = getCandlesByIndex(setting.tag, 0,
                                      number_of_candles - 2 * len - shift,
                                      2 * len)
-- SetUpdateCallback

    local Up = false
    local Down = false
    for i = 0, n - 1 do
        local num = n - 1 - i

        setting.fractals_collection[number_of_candles] =
            {['high'] = t[num].high, ['low'] = t[num].low};
        if (t[num].high) > 0 then
            setting.fractals_collection[number_of_candles] =
                {['high'] = t[num].high, ['low'] = t[num].low};
            setting.fractal_up = t[num].high;
            setting.fractal_down = t[num].low;
            Up = true;
        end
        if (t[num].low) > 0 then

            setting.fractals_collection[number_of_candles]['low'] = t[num].low;

            Down = true;

        end
        if Up and Down then break end
    end
end
M.last = last
return M
