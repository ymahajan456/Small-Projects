classdef DTS
    properties
        time
        val
        set
    end
    methods
        function val = readDTS(obj,time)
            if (find(obj.time == time) > 0)
                val = obj.set(time);
            else
                val = 0;
            end
        end
    end
end