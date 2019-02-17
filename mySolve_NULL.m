function RR = mySolve_NULL(args)
    A = args.A;
    ARR = args.ARR;
    [N, K] = size(ARR);
    RR = zeros(N,K);
    for k = 1:K
        RR(:,k) = ARR(:,k);
    end
end
