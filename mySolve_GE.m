function RR = mySolve_GE(args)
    A = args.A;
    ARR = args.ARR;
    [N, K] = size(ARR);
    RR = zeros(N,K);
    % Solve for each column
    for k = 1:K
        RR(:,k) = A \ ARR(:,k);
    end
end
