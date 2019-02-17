function RR = mySolve_inv(args)
    A = args.A;
    ARR = args.ARR;
    [N, K] = size(ARR);
    RR = zeros(N,K);
    % compute the inverse
    Ainv = inv(A);
    % multiply ecah column by the inverse
    for k = 1:K
        RR(:,k) = Ainv*ARR(:,k);
    end
end
