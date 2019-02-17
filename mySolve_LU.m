function RR = mySolve_LU(args)
    A = args.A;
    ARR = args.ARR;
    [N, K] = size(ARR);
    RR = zeros(N,K);
    % compute the LU decomposition
    [L, U, P] = lu(A);
    for k = 1:K
        % use the L, U, P matrices to solve for RR one column at a time
        RR(:,k) = U \ (L \ (P * ARR(:,k)));
    end
end
