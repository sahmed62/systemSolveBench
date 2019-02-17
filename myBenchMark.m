function [timelist, errorlist] = myBenchMark(func, args, refVals, iterations)
    % initialize (allocate space) for the output variables
    timelist = zeros(1, iterations);
    errorlist = zeros(1, iterations);
    % do a control run to remove "cold start" effects
    func(args);
    for n = 1:iterations
        tic
        vals = func(args);
        timelist(n) = toc;
        errorlist(n) = myRMSError(vals, refVals);
    end
end
